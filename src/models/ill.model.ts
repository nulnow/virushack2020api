import { Column, Model, Table, ForeignKey } from 'sequelize-typescript'
import { User } from './user.model'

@Table
export class Ill extends Model<Ill> {
    @ForeignKey(() => User)
    @Column
    userId: number

    @Column text: string
    @Column recommendations: string
    @Column startDate: Date
    @Column contraindications: string
    @Column titleText: string
}
