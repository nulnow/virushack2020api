import { Module } from '@nestjs/common'
import { TokensService } from './tokens.service'
import { RedisModule } from '../redis/redis.module'

@Module({
    imports: [RedisModule],
    providers: [TokensService],
    exports: [TokensService],
})
export class TokensModule {}
