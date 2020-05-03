import { Column, Model, Table } from 'sequelize-typescript'

@Table
export class Location extends Model<Location> {
    @Column city: string
    @Column region: string
}
