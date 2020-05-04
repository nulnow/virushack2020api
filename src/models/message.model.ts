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
import { User } from './user.model'
import { Chat } from './chat.model'
import { Location } from './location.model'

@Table
export class Message extends Model<Message> {
    @ApiProperty() @Column content: string

    @ForeignKey(() => User)
    @ApiProperty()
    @Column
    userId: string

    @ForeignKey(() => Chat)
    @ApiProperty()
    @Column
    chatId: number

    @ForeignKey(() => Doctor)
    @ApiProperty()
    @Column
    doctorId: number

    @ApiProperty() @Column isFromUser: boolean

    @BelongsTo(() => User)
    @ApiProperty()
    user: User

    @BelongsTo(() => Doctor)
    @ApiProperty()
    doctor: Doctor

    @BelongsTo(() => Chat)
    @ApiProperty()
    chat: Chat

    // @ApiProperty({ type: () => Vizit })
    // @HasMany(() => Vizit)
    // vizits: Vizit[]
    //
    // @ApiProperty({ type: () => Ill })
    // @HasMany(() => Ill)
    // ills: Ill[]
}
