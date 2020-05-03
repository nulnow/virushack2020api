import { Injectable } from '@nestjs/common'
import { RedisService } from '../redis/redis.service'

@Injectable()
export class TokensService {
    constructor(private redisService: RedisService) {}

    async get(token: string): Promise<string> {
        return await this.redisService.get(`token.${token}`)
    }

    async set(token: string, userId: number): Promise<boolean> {
        return await this.redisService.set(`token.${token}`, userId)
    }
}
