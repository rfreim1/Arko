//
//  User.m
//  UserForeSight
//
//  Created by Ross Freiman on 7/24/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize userName = _userName;
@synthesize password = _password;
@synthesize email = _email;

-(id)initWithUserName:(NSString *)username password:(NSString *)password email:(NSString *)email{
    self.userName = username;
    self.password = password;
    self.email = email;
    return self;
}

@end
