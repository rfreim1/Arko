//
//  BusinessHours.m
//  UserForeSight
//
//  Created by Ross Freiman on 8/25/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "BusinessHours.h"

@implementation BusinessHours

@synthesize openingTime = _openingTime;
@synthesize closingTime = _closingTime;

-(id)initHoursOpening:(NSString *)opening closing:(NSString *)closing{
    if (self = [super init]) {
        self.openingTime = opening;
        self.closingTime = closing;
    }
    
    return self;
}

@end
