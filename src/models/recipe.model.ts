import { Column, ForeignKey, Model, Table } from 'sequelize-typescript'
import { User } from './user.model'
import { Ill } from './ill.model'

@Table
export class Recipe extends Model<Recipe> {
    @ForeignKey(() => User)
    @Column
    userId: number

    @ForeignKey(() => Ill)
    @Column
    illId: number

    @Column guid: string
    @Column title: string
    @Column body: string
}
