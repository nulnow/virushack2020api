import { Column, Model, Table, ForeignKey } from 'sequelize-typescript'
import { User } from './user.model'
import { Ill } from './ill.model'
import { Hospital } from './hospital.modal'

@Table
export class Vizit extends Model<Vizit> {
    @ForeignKey(() => User)
    @Column
    userId: number

    @ForeignKey(() => Ill)
    @Column
    illId: number

    @ForeignKey(() => Hospital)
    @Column
    hospitalId: number

    @Column text: string
}
