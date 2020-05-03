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

@Table
export class User extends Model<User> {
    @Column firstName: string

    @Column lastName: string
    @Column middleName: string
    @Column guid: string
    @Column email: string
    @Column password: string
    @Column phone: string
    @Column snils: string
    @Column polis: string
    @Column passport: string

    @HasMany(() => Ill)
    vizits: Ill[]
}
