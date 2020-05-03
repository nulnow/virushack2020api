import { Column, ForeignKey, Model, Table } from 'sequelize-typescript'
import { Location } from './location.model'

@Table
export class Hospital extends Model<Hospital> {
    @ForeignKey(() => Location)
    @Column
    locationId: number

    @Column title: string
}
