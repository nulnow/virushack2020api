import { ApiProperty } from '@nestjs/swagger'

export class MessageDto {
    @ApiProperty() chatId: number
    @ApiProperty() content: number
}
