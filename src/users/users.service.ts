import { Injectable } from '@nestjs/common'
import { IUser } from './interfaces/IUser'
import { InjectModel } from '@nestjs/sequelize'
import { User } from '../models/user.model'

@Injectable()
export class UsersService {
    private users: IUser[] = [
        {
            id: 1,
            email: 'test@test.test',
            username: 'test',
            password: 'secret',
        },
    ]

    constructor(
        @InjectModel(User)
        private userModel: typeof User,
    ) {}

    async getById(userId: number): Promise<any> {
        return this.users.find(user => user.id === userId)
    }

    async getAll(): Promise<any> {
        return this.userModel.findAll()
    }
}
