import {
    createParamDecorator,
    ExecutionContext,
    UnauthorizedException,
} from '@nestjs/common'
import { Request } from 'express'

export const User = createParamDecorator(
    async (data: unknown, ctx: ExecutionContext) => {
        const request: Request = ctx.switchToHttp().getRequest()

        // eslint-disable-next-line @typescript-eslint/ban-ts-ignore
        // @ts-ignore
        return request.user
        // const queryToken: string = (request.query.token || '').toString()
        // const authHeader = request.headers['Authorization']
        // if (!authHeader && !queryToken) {
        //     throw new UnauthorizedException()
        // }
        // const token: string = (
        //     queryToken || authHeader.slice('Bearer '.length)
        // ).toString()
        // if (!token) {
        //     throw new UnauthorizedException()
        // }
        // const tokenInSessions = await this.tokensService.get(token)
        // if (!tokenInSessions) {
        //     throw new UnauthorizedException()
        // }
        // const user = this.usersService.getUserByToken(token)
        // if (!user) {
        //     throw new UnauthorizedException()
        // }
        // return user
    },
)
