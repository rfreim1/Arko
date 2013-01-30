//
//  StatusData.m
//  AdminForeSight
//
//  Created by Bhaskar Ravi on 7/31/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "StatusData.h"

@implementation StatusData

@synthesize statusText = _statusText;
@synthesize postTime = _postTime;

-(id)initWithStatusText:(NSString *)statusText postTime:(NSString *)postTime{
    if (self = [super init]) {
        self.statusText = statusText;
        self.postTime = postTime;
    }
    return self;
}


@end
