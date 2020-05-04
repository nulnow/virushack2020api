import {
    Injectable,
    CanActivate,
    ExecutionContext,
    UnauthorizedException,
} from '@nestjs/common'
import { TokensService } from './tokens/tokens.service'
import { Request } from 'express'
import { InjectModel } from '@nestjs/sequelize'
import { User } from './models/user.model'

@Injectable()
export class AuthGuard implements CanActivate {
    constructor(
        private tokensService: TokensService,
        @InjectModel(User)
        private userModel: typeof User,
    ) {}

    async canActivate(context: ExecutionContext): Promise<boolean> {
        const request: Request = context.switchToHttp().getRequest()
        const queryToken: string = (request.query.token || '').toString()
        const authHeader = request.headers['authorization']
        console.log('AuthGuard canActivate')
        console.log({
            authHeader,
            queryToken,
        })
        if (!authHeader && !queryToken) {
            throw new UnauthorizedException()
        }
        const token: string = (
            queryToken || authHeader.slice('Bearer '.length)
        ).toString()
        if (!token) {
            throw new UnauthorizedException()
        }
        const userId = token
        if (!userId) {
            throw new UnauthorizedException()
        }

        const user = await this.userModel.findByPk(+userId)
        if (!user) {
            throw new UnauthorizedException()
        }

        // eslint-disable-next-line @typescript-eslint/ban-ts-ignore
        // @ts-ignore
        request.user = user
        return true
    }
}
