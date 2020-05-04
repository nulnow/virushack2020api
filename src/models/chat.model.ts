import {
    BelongsTo,
    BelongsToMany,
    Column,
    ForeignKey,
    HasMany,
    Model,
    Table,
} from 'sequelize-typescript'
import { Vizit } from './vizit.model'
import { Ill } from './ill.model'
import { ApiProperty } from '@nestjs/swagger'
import { Doctor } from './doctor.model'
import { Location } from './location.model'
import { User } from './user.model'

@Table
export class Chat extends Model<Chat> {
    @ForeignKey(() => User)
    @ApiProperty()
    @Column
    userId: string

    @ForeignKey(() => Doctor)
    @ApiProperty()
    @Column
    doctorId: string

    @ApiProperty({ type: () => Doctor })
    @BelongsTo(() => Doctor)
    doctor: Doctor

    @ApiProperty({ type: () => User })
    @BelongsTo(() => User)
    user: User
}
