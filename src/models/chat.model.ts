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

@Table
export class Chat extends Model<Chat> {
    @Column firstName: string

    @ApiProperty() @Column content: string
    @ApiProperty() @Column userId: string
    @ApiProperty() @Column chatId: string
    @ApiProperty() @Column doctorId: string
    @ApiProperty() @Column isFromUser: boolean

    // @ApiProperty({ type: () => Vizit })
    // @HasMany(() => Vizit)
    // vizits: Vizit[]
    //
    // @ApiProperty({ type: () => Ill })
    // @HasMany(() => Ill)
    // ills: Ill[]
}
