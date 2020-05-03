import { Injectable } from '@nestjs/common'
import { promisify } from 'util'
import redis = require('redis')

@Injectable()
export class RedisService {
    private readonly client: redis.RedisClient

    constructor() {
        try {
            //this.client = redis.createClient()
        } catch (e) {
            console.error(e)
        }
    }

    get(...args) {
        return promisify(this.client.get).bind(this.client)(...args)
    }

    set(...args) {
        return promisify(this.client.set).bind(this.client)(...args)
    }
}
