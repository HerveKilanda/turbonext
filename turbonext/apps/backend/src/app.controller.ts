import { createUserSchema } from '@repo/types';
import type { CreateUserDto } from '@repo/types';
import { Body, Controller, Get, Post, UsePipes } from '@nestjs/common';
import { AppService } from './app.service';
import { ZodValidationPipe } from './zod/zod-schema';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }
@Post()
@UsePipes(new ZodValidationPipe(createUserSchema))
  create(@Body() createUserDto: CreateUserDto) {
    console.log(createUserDto);
  }
}
