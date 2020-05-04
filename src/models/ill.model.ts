import { Column, ForeignKey, HasMany, Model, Table } from 'sequelize-typescript'
import { User } from './user.model'
import { Vizit } from './vizit.model'
import { ApiProperty } from '@nestjs/swagger'

@Table
export class Ill extends Model<Ill> {
    @ApiProperty({ type: () => User })
    @ForeignKey(() => User)
    @Column
    userId: number

    @ApiProperty({ type: String })
    @Column
    text: string
    @Column recommendations: string

    // @HasMany(() => Vizit)
    // vizits: Vizit[]
}
