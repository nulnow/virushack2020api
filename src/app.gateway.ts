import {
    SubscribeMessage,
    WebSocketGateway,
    OnGatewayInit,
    WebSocketServer,
    OnGatewayConnection,
    OnGatewayDisconnect,
} from '@nestjs/websockets'
import { Logger } from '@nestjs/common'
import { Socket, Server } from 'socket.io'
import { MESSAGES_TYPES } from './CONSTANTS/MESSATES_TYPES'

@WebSocketGateway()
export class AppGateway
    implements OnGatewayInit, OnGatewayConnection, OnGatewayDisconnect {
    @WebSocketServer()
    server: Server

    private logger: Logger = new Logger('AppGateway')

    @SubscribeMessage(MESSAGES_TYPES.MESSAGE)
    handleMessage(client: Socket, payload: string): void {
        this.server.emit(MESSAGES_TYPES.MESSAGE, payload)
    }

    afterInit(server: Server) {
        this.logger.log('Init')
    }

    handleDisconnect(client: Socket) {
        this.logger.log(`Client disconnected: ${client.id}`)
    }

    handleConnection(client: Socket, ...args: any[]) {
        this.logger.log(`Client connected: ${client.id}`)
    }
}
