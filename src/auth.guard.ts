import {
    Injectable,
    CanActivate,
    ExecutionContext,
    UnauthorizedException,
} from '@nestjs/common'
import { TokensService } from './tokens/tokens.service'
import { Request } from 'express'

@Injectable()
export class AuthGuard implements CanActivate {
    constructor(private tokensService: TokensService) {}

    async canActivate(context: ExecutionContext): Promise<boolean> {
        const request: Request = context.switchToHttp().getRequest()
        const queryToken: string = request.query.token.toString()
        const authHeader = request.headers['Authorization']
        if (!authHeader && !queryToken) {
            throw new UnauthorizedException()
        }
        const token: string = (
            queryToken || authHeader.slice('Bearer '.length)
        ).toString()
        if (!token) {
            throw new UnauthorizedException()
        }
        if (!(await this.tokensService.get(token))) {
            throw new UnauthorizedException()
        }
        return true
    }
}
