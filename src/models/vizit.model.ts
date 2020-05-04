import {
    Column,
    Model,
    Table,
    ForeignKey,
    HasMany,
    HasOne,
} from 'sequelize-typescript'
import { User } from './user.model'
import { Ill } from './ill.model'
import { Hospital } from './hospital.modal'
import { ApiProperty } from '@nestjs/swagger'

@Table
export class Vizit extends Model<Vizit> {
    @ApiProperty({ type: Number })
    @ForeignKey(() => User)
    @Column
    userId: number

    @ApiProperty({ type: Number })
    @ForeignKey(() => Ill)
    @Column
    illId: number

    @ApiProperty({ type: Hospital })
    @ForeignKey(() => Hospital)
    @Column
    hospitalId: number

    @ApiProperty({ type: String })
    @Column
    text: string

    // @ApiProperty({ type: () => Ill })
    // @HasOne(() => Ill)
    // ill: Ill
}
