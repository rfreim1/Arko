//
//  CommentData.h
//  UserForeSight
//
//  Created by Bhaskar Ravi on 8/14/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentData : NSObject

@property (strong, nonatomic) NSString *commentText;
@property (strong, nonatomic) NSDate *postTime;
@property (strong, nonatomic) NSString *authorName;


-(id)initWithText:(NSString *) text postTime:(NSDate *)postTime authorName:(NSString *)authorName;

@end
