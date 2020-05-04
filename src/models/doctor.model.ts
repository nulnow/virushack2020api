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
export class Doctor extends Model<Doctor> {
    @ApiProperty() @Column name: string
}
