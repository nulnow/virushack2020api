import {
    BelongsTo,
    BelongsToMany,
    Column,
    HasMany,
    Model,
    Table,
} from 'sequelize-typescript'
import { Vizit } from './vizit.model'
import { Ill } from './ill.model'
import { ApiProperty } from '@nestjs/swagger'
import { Chat } from './chat.model'

@Table
export class User extends Model<User> {
    @Column firstName: string

    @ApiProperty() @Column lastName: string
    @ApiProperty() @Column middleName: string
    @ApiProperty() @Column guid: string
    @ApiProperty() @Column email: string
    @ApiProperty() @Column password: string
    @ApiProperty() @Column phone: string
    @ApiProperty() @Column snils: string
    @ApiProperty() @Column polis: string
    @ApiProperty() @Column passport: string

    @ApiProperty({ type: () => Vizit })
    @HasMany(() => Vizit)
    vizits: Vizit[]

    @ApiProperty({ type: () => Ill })
    @HasMany(() => Ill)
    ills: Ill[]

    @ApiProperty({ type: () => Chat })
    @HasMany(() => Chat)
    chats: Chat[]
}
