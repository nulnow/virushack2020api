import { Injectable } from '@nestjs/common'
import { promisify } from 'util'
import redis = require('redis')

const test = true

@Injectable()
export class RedisService {
    private readonly client: redis.RedisClient
    private cache: any = {}
    constructor() {
        try {
            //this.client = redis.createClient()
        } catch (e) {
            console.error(e)
        }
    }

    async get(...args) {
        if (test) {
            console.log(this.cache)
            return this.cache[args[0]]
        }
        return await promisify(this.client.get).bind(this.client)(...args)
    }

    async set(...args) {
        if (test) {
            this.cache[args[0]] = args[1]
            console.log(this.cache)
            return
        }
        return await promisify(this.client.set).bind(this.client)(...args)
    }
}
