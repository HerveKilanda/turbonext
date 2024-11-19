import { clerkClient } from '@clerk/clerk-sdk-node';
import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello World! tu vas bien ?';
  }

  async getUsers(): Promise<ReturnType<typeof clerkClient.users.getUserList>> {
    return clerkClient.users.getUserList();
  }
}
