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
import { on } from './events'
import { MessageDto } from './dto/message.dto'

@WebSocketGateway()
export class AppGateway
    implements OnGatewayInit, OnGatewayConnection, OnGatewayDisconnect {
    @WebSocketServer()
    server: Server

    private logger: Logger = new Logger('AppGateway')

    constructor(
        @InjectModel(User)
        private userModel: typeof User,
    ) {
        // on('message', (data) => {
        //
        // })
    }

    @UseGuards(AuthGuard)
    @SubscribeMessage(MESSAGES_TYPES.MESSAGE)
    handleMessage(client: Socket, messageDto: MessageDto): void {
        this.server.emit(MESSAGES_TYPES.MESSAGE, payload)
    }

    @SubscribeMessage('AUTH')
    async auth(client: Socket, payload: string) {
        const user = this.userModel.findByPk(+payload)
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
