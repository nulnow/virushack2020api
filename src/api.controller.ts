import {
    Body,
    Controller,
    Get,
    HttpException,
    HttpStatus,
    Post,
    Query,
    UseGuards,
} from '@nestjs/common'
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
    WebSocketServer,
} from '@nestjs/websockets'
import { Server, Socket } from 'socket.io'

import { InjectModel } from '@nestjs/sequelize'
import { Ill } from './models/ill.model'
import { Location } from './models/location.model'
import { Hospital } from './models/hospital.modal'
import { Vizit } from './models/vizit.model'
import { Recipe } from './models/recipe.model'
import { User } from './models/user.model'
import { User as UserDecorator } from './user.decorator'
import { ApiCreatedResponse, ApiOkResponse } from '@nestjs/swagger'
import { LoginDto } from './dto/login.dto'
import { RegisterDto } from './dto/register.dto'
import { AuthResponseDto } from './dto/auth-response.dto'

@Controller('/api')
@WebSocketGateway(+(process.env.PORT || 6062), { namespace: 'events' })
export class ApiController implements OnGatewayConnection, OnGatewayDisconnect {
    @WebSocketServer()
    private readonly server: Server

    constructor(
        private readonly appService: AppService,
        private readonly tokensService: TokensService,
        private readonly redisService: RedisService,
        private readonly usersService: UsersService,

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

    @SubscribeMessage(MESSAGES_TYPES.MESSAGE)
    @UseGuards(AuthGuard)
    async handleEvent(
        @MessageBody() data: string,
        @ConnectedSocket() client: Socket,
        @UserDecorator() user,
    ) {
        return this.server.emit('message', {
            text: 'hello',
        })
    }

    handleConnection(client: Socket, ...args: any[]): any {}

    handleDisconnect(client: Socket): any {}

    @Get('/supreme')
    async supreme() {
        return `
            <pre>
            ${JSON.stringify(
                {
                    users: await this.userModel.findAll({
                        include: [
                            {
                                model: Ill,
                                include: [Vizit],
                            },
                            Vizit,
                        ],
                    }),
                },
                null,
                4,
            )}
            </pre>
        `.trim()
    }

    @UseGuards(AuthGuard)
    @Get('/profile')
    @ApiOkResponse({
        type: User,
    })
    async profile(@UserDecorator() user) {
        return this.userModel.findOne({
            where: {
                id: user.id,
            },
            include: [
                {
                    model: Ill,
                    include: [Vizit],
                },
                // Vizit,
            ],
        })
    }

    @Post('/login')
    @ApiOkResponse({
        type: AuthResponseDto,
    })
    async login(@Body() loginDto: LoginDto): Promise<AuthResponseDto> {
        const user = await this.userModel.findOne({
            where: { email: (loginDto.email || '').trim() },
        })
        if (!user)
            throw new HttpException('Неправильно', HttpStatus.BAD_REQUEST)
        return {
            access_token: user.id,
        }
    }

    @Get('/login')
    @ApiOkResponse({
        type: AuthResponseDto,
    })
    async getLogin(@Query('email') email): Promise<AuthResponseDto> {
        const user = await this.userModel.findOne({
            where: { email: email.trim() },
        })

        if (!user)
            throw new HttpException('Неправильно', HttpStatus.BAD_REQUEST)
        return {
            access_token: user.id,
        }
    }

    @Post('/register')
    @ApiOkResponse({
        type: AuthResponseDto,
    })
    async register(@Body() registerDto: RegisterDto): Promise<AuthResponseDto> {
        const userWithThisEmail = await this.userModel.findOne({
            where: { email: registerDto.email },
        })
        if (userWithThisEmail) {
            throw new HttpException(
                'Уже есть пользователь с таким мейлом',
                HttpStatus.BAD_REQUEST,
            )
        }
        const newUser = await this.userModel.create(registerDto)
        return {
            access_token: newUser.id,
        }
    }

    @Get('/vizits')
    async vizits(): Promise<Vizit[]> {
        return this.vizitModel.findAll({
            include: [Ill],
        })
    }

    @Get('/hospitals')
    @ApiOkResponse({
        type: Hospital,
    })
    async hospitals(): Promise<Hospital[]> {
        return this.hospitalModel.findAll({
            include: [Location],
        })
    }

    @Get('/get')
    async get(@Query('key') key: string): Promise<string> {
        return 'gotten: ' + (await this.redisService.get(key))
    }

    @Get('/set')
    async set(
        @Query('key') key: string,
        @Query('value') value: string,
    ): Promise<string> {
        await this.redisService.set(key, value)
        return 'set: ' + (await this.redisService.get(key))
    }

    @Get('/setToken')
    async setToken(
        @Query('key') key: string,
        @Query('value') value: string,
    ): Promise<string> {
        await this.tokensService.set(key, +value)
        return 'set: ' + (await this.tokensService.get(key))
    }

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
