//
//  StatusData.h
//  AdminForeSight
//
//  Created by Bhaskar Ravi on 7/31/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusData : NSObject

@property (nonatomic, strong) NSString *statusText;
@property (nonatomic, strong) NSString *postTime;

-(id)initWithStatusText:(NSString *)statusText postTime:(NSString *)postTime;

@end
