import { Controller, Get, Query, Render, UseGuards } from '@nestjs/common'
import { AppService } from './app.service'
import { TokensService } from './tokens/tokens.service'
import { RedisService } from './redis/redis.service'
import { AuthGuard } from './auth.guard'
import { UsersService } from './users/users.service'
import {
    ConnectedSocket,
    MessageBody,
    OnGatewayConnection,
    OnGatewayDisconnect,
    SubscribeMessage,
    WebSocketGateway,
    WebSocketServer,
} from '@nestjs/websockets'
import { Server, Socket } from 'socket.io'
import { MESSAGES_TYPES } from './CONSTANTS/MESSATES_TYPES'
import { User } from './user.decorator'

@Controller()
export class AppController implements OnGatewayConnection, OnGatewayDisconnect {
    @WebSocketServer()
    private readonly server: Server
    private gameStorage: any = {}

    constructor(
        private readonly appService: AppService,
        private readonly tokensService: TokensService,
        private readonly redisService: RedisService,
        private readonly usersService: UsersService,
    ) {}

    @Get()
    @Render('index')
    index() {}

    @Get('/chat')
    @Render('chat')
    chat() {}

    handleConnection(client: Socket, ...args: any[]): any {}

    handleDisconnect(client: Socket): any {}

    @SubscribeMessage(MESSAGES_TYPES.COMMAND)
    @UseGuards(AuthGuard)
    async handleEvent(
        @MessageBody() data: string,
        @ConnectedSocket() client: Socket,
        @User() user,
    ) {
        // todo validate command
        return await new (class CommandProcessor {
            constructor(
                private readonly user: any,
                private readonly command: any,
            ) {}
            async handleCommand() {
                return 1
            }
        })(user, data).handleCommand()
    }
}
