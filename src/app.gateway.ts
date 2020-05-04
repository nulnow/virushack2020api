import {
    SubscribeMessage,
    WebSocketGateway,
    OnGatewayInit,
    WebSocketServer,
    OnGatewayConnection,
    OnGatewayDisconnect,
} from '@nestjs/websockets'
import { Logger, UseGuards } from '@nestjs/common'
import { Socket, Server } from 'socket.io'
import { MESSAGES_TYPES } from './CONSTANTS/MESSATES_TYPES'
import { AuthGuard } from './auth.guard'
import { User as UserDecorator } from './user.decorator'
import { InjectModel } from '@nestjs/sequelize'
import { User } from './models/user.model'
import { MessageDto } from './dto/message.dto'
import { Doctor } from './models/doctor.model'
import { Message } from './models/message.model'
import { Chat } from './models/chat.model'
import * as moment from 'moment'

@WebSocketGateway()
export class AppGateway
    implements OnGatewayInit, OnGatewayConnection, OnGatewayDisconnect {
    @WebSocketServer()
    server: Server

    private logger: Logger = new Logger('AppGateway')

    constructor(
        @InjectModel(User)
        private userModel: typeof User,

        @InjectModel(Doctor)
        private doctorModel: typeof Doctor,

        @InjectModel(Message)
        private messageModel: typeof Message,

        @InjectModel(Chat)
        private chatModel: typeof Chat,
    ) {}

    @SubscribeMessage(MESSAGES_TYPES.MESSAGE)
    async handleMessage(client: Socket, messageDto: MessageDto) {
        console.log({ messageDto })
        const chat = await this.chatModel.findByPk(+messageDto.chatId)
        console.log({ chat })
        const doctor = await this.doctorModel.findByPk(1)
        console.log({ doctor })
        // @ts-ignore
        const user: any = client.user

        const mess = {
            chatId: chat.id,
            content: messageDto.content,
            doctorId: doctor.id,
            userId: user.id,
            createdAt: new Date(),
            isFromUser: true,
        }
        console.log({ mess })
        const message = await this.messageModel.create(mess)
        const createdAt = moment(message.createdAt).format('HH:mm')
        client.emit(MESSAGES_TYPES.MESSAGE, {
            ...message.toJSON(),
            user: user.toJSON(),
            // @ts-ignore
            doctor: doctor.toJSON(),
            // @ts-ignore
            chat: chat.toJSON(),
            createdAt,
        })
    }

    @SubscribeMessage('AUTH')
    async auth(client: Socket, payload: any) {
        const user = await this.userModel.findByPk(+payload.token)

        // @ts-ignore
        client.user = user
    }

    async getUserFromSocket(message) {
        const userId = message.token
        const user = 1
    }

    afterInit(server: Server) {
        this.logger.log('Init')
    }

    handleDisconnect(client: Socket) {
        this.logger.log(`Client disconnected: ${client.id}`)
    }

    async handleConnection(client: Socket) {
        const user = await this.getUserFromRequest(client.request)
        // @ts-ignore
        client.user = user
        this.logger.log(`Client connected: ${client.id}`)
    }

    async getUserFromRequest(request: any) {
        const token = request.headers.authorization
        if (!token) return null
        const user = await this.userModel.findByPk(+token)
        return user
    }
}
