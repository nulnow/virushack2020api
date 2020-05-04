import { ApiProperty } from '@nestjs/swagger'

export class RegisterDto {
    @ApiProperty() email: string
    @ApiProperty() password: string
    @ApiProperty() firstName: string
    @ApiProperty() lastName: string
    @ApiProperty() middleName: string
    @ApiProperty() phone: string
    @ApiProperty() snils: string
    @ApiProperty() polis: string
    @ApiProperty() passport: string
}
