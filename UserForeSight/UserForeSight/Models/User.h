//
//  User.h
//  UserForeSight
//
//  Created by Ross Freiman on 7/24/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *email;

-(id)initWithUserName:(NSString*) username password:(NSString*)password email:(NSString *) email;

@end
