import { Column, HasMany, Model, Table } from 'sequelize-typescript'
import { Hospital } from './hospital.modal'
import { ApiProperty } from '@nestjs/swagger'

@Table
export class Location extends Model<Location> {
    @ApiProperty({ type: String })
    @Column
    city: string

    @ApiProperty({ type: String })
    @Column
    region: string

    @ApiProperty({ type: () => Hospital })
    @HasMany(() => Hospital)
    hospitals: Hospital[]
}
