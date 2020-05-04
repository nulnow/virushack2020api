import {
    BelongsTo,
    Column,
    ForeignKey,
    HasOne,
    Model,
    Table,
} from 'sequelize-typescript'
import { Location } from './location.model'
import { ApiProperty } from '@nestjs/swagger'

@Table
export class Hospital extends Model<Hospital> {
    @ApiProperty({ type: Number })
    @ForeignKey(() => Location)
    @Column
    locationId: number

    @ApiProperty({ type: String })
    @Column
    title: string

    @ApiProperty({ type: () => Location })
    @BelongsTo(() => Location)
    location: Location
}
