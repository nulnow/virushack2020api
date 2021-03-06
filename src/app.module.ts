import { Module } from '@nestjs/common'
import { AppController } from './app.controller'
import { AppService } from './app.service'
import { TokensModule } from './tokens/tokens.module'
import { UsersModule } from './users/users.module'
import { PushModule } from './push/push.module'
import { RedisModule } from './redis/redis.module'
import { TokensService } from './tokens/tokens.service'
import { SequelizeModule } from '@nestjs/sequelize'
import { User } from './models/user.model'
import { ApiController } from './api.controller'
import { Ill } from './models/ill.model'
import { Location } from './models/location.model'
import { Hospital } from './models/hospital.modal'
import { Recipe } from './models/recipe.model'
import { Vizit } from './models/vizit.model'
import { AppGateway } from './app.gateway'
import { Message } from './models/message.model'
import { Doctor } from './models/doctor.model'
import { Chat } from './models/chat.model'

@Module({
    imports: [
        TokensModule,
        UsersModule,
        PushModule,
        RedisModule,
        // SequelizeModule.forRoot({
        //     dialect: 'postgres',
        //     host: 'localhost',
        //     port: 5432,
        //     username: 'admin_supreme',
        //     password: 'supreme',
        //     database: 'virushack2020',
        //     models: [User],
        // }),
        SequelizeModule.forRoot({
            dialect: 'postgres',
            host: 'rogue.db.elephantsql.com',
            port: 5432,
            username: 'ahtvaiue',
            password: 'kEP9L4gWSDFQf9NBt6-_uBAStgDh8_5C',
            database: 'ahtvaiue',
            models: [
                User,
                Ill,
                Vizit,
                Location,
                Hospital,
                Recipe,
                Message,
                Chat,
                Doctor,
            ],
            synchronize: true,
        }),
        SequelizeModule.forFeature([
            User,
            Ill,
            Vizit,
            Location,
            Hospital,
            Recipe,
            Message,
            Chat,
            Doctor,
        ]),
    ],
    controllers: [AppController, ApiController],
    providers: [AppService, TokensService, AppGateway],
})
export class AppModule {}
