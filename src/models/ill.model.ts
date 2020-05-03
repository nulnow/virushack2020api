import {
    Column,
    Model,
    Table,
    ForeignKey,
    HasMany,
    HasOne,
    BelongsTo,
} from 'sequelize-typescript'
import { User } from './user.model'
import { Hospital } from './hospital.modal'

@Table
export class Ill extends Model<Ill> {
    @ForeignKey(() => User)
    @Column
    userId: number

    @Column text: string
    @Column recommendations: string

    // @BelongsTo(() => Hospital)
    // hospital: Hospital
}
