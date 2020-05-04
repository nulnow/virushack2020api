require('dotenv').config()
import { NestExpressApplication } from '@nestjs/platform-express'
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger'

import { NestFactory } from '@nestjs/core'
import { AppModule } from './app.module'
import { join } from 'path'
import * as morgan from 'morgan'
import * as cors from 'cors'

async function bootstrap() {
    const app = await NestFactory.create<NestExpressApplication>(AppModule)
    app.use(cors())
    const options = new DocumentBuilder()
        .setTitle('Сердце')
        .setDescription('Swagger for Сердце app')
        .setVersion('1.0')
        .addTag('Сердце 1.0')
        .build()

    const document = SwaggerModule.createDocument(app, options)
    SwaggerModule.setup('api', app, document)

    app.useStaticAssets(join(__dirname, '..', 'public'))
    app.setBaseViewsDir(join(__dirname, '..', 'views'))
    app.setViewEngine('ejs')
    app.use(morgan('combined'))
    await app.listen(process.env.PORT || 6064)
}

bootstrap()
