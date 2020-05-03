import { Column, ForeignKey, Model, Table } from 'sequelize-typescript'
import { User } from './user.model'

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
