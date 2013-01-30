//
//  BusinessHours.h
//  UserForeSight
//
//  Created by Ross Freiman on 8/25/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusinessHours : NSObject

@property (strong, nonatomic) NSString *openingTime;
@property (strong, nonatomic) NSString *closingTime;

-(id)initHoursOpening:(NSString *)opening closing:(NSString*)closing;

@end
