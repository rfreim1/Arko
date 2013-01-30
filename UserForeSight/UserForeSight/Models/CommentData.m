//
//  CommentData.m
//  UserForeSight
//
//  Created by Ross Freiman on 8/14/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "CommentData.h"

@implementation CommentData

@synthesize commentText = _commentText;
@synthesize authorName = _authorName;
@synthesize postTime = _postTime;


-(id)initWithText:(NSString *)text postTime:(NSDate *)postTime authorName:(NSString *)authorName{
    if (self = [super init]) {
        self.commentText = text;
        self.postTime = postTime;
        self.authorName = authorName;
    }
    return self;
}

@end
