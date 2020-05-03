import { Controller, Get, Query, UseGuards } from '@nestjs/common'
import { MESSAGES_TYPES } from './CONSTANTS/MESSATES_TYPES'
import { AuthGuard } from './auth.guard'
import { AppService } from './app.service'
import { TokensService } from './tokens/tokens.service'
import { RedisService } from './redis/redis.service'
import { UsersService } from './users/users.service'
import {
    ConnectedSocket,
    MessageBody,
    OnGatewayConnection,
    OnGatewayDisconnect,
    SubscribeMessage,
    WebSocketGateway,
} from '@nestjs/websockets'
import { Socket } from 'socket.io'

import { InjectModel } from '@nestjs/sequelize'
import { Ill } from './models/ill.model'
import { Location } from './models/location.model'
import { Hospital } from './models/hospital.modal'
import { Vizit } from './models/vizit.model'
import { Recipe } from './models/recipe.model'
import { User } from './models/user.model'
import { User as UserDecorator } from './user.decorator'

@Controller('/api')
@WebSocketGateway(+(process.env.PORT || 6062), { namespace: 'events' })
export class ApiController implements OnGatewayConnection, OnGatewayDisconnect {
    constructor(
        // private readonly appService: AppService,
        // private readonly tokensService: TokensService,
        // private readonly redisService: RedisService,
        // private readonly usersService: UsersService,

        @InjectModel(User)
        private userModel: typeof User,

        @InjectModel(Ill)
        private illModel: typeof Ill,

        @InjectModel(Vizit)
        private vizitModel: typeof Vizit,

        @InjectModel(Recipe)
        private recipeModel: typeof Recipe,

        @InjectModel(Hospital)
        private hospitalModel: typeof Hospital,

        @InjectModel(Location)
        private locationModel: typeof Location,
    ) {}

    handleConnection(client: Socket, ...args: any[]): any {}

    handleDisconnect(client: Socket): any {}

    @Get('/supreme')
    async supreme() {
        return `
            <pre>
            ${JSON.stringify(
                {
                    users: await this.userModel.findAll({
                        include: [Ill],
                    }),
                },
                null,
                4,
            )}
            </pre>
        `
    }

    @Get('/vizits')
    async vizits() {
        return `
            <pre>
            ${JSON.stringify(
                {
                    users: await this.vizitModel.findAll({
                        //include: [Ill],
                    }),
                },
                null,
                4,
            )}
            </pre>
        `
    }

    // @Get('/get')
    // async get(@Query('key') key: string): Promise<string> {
    //     return 'gotten: ' + (await this.redisService.get(key))
    // }
    //
    // @Get('/set')
    // async set(
    //     @Query('key') key: string,
    //     @Query('value') value: string,
    // ): Promise<string> {
    //     await this.redisService.set(key, value)
    //     return 'set: ' + (await this.redisService.get(key))
    // }

    // @Get('/secret')
    // @UseGuards(AuthGuard)
    // async secret(): Promise<string> {
    //     return this.tokensService.get('supreme')
    // }

    // @Get('/users')
    // async users() {
    //     return this.usersService.getAll()
    // }
}
