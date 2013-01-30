//
//  HelperFunctions.m
//  UserForeSight
//
//  Created by Bhaskar Ravi on 8/7/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "HelperFunctions.h"

@implementation HelperFunctions


//changes height of textfield to static height set beforehand(may change to have height as input)

-(void)changeTextfield:(UITextField *)textfield height:(float)height{
    CGRect frame =textfield.frame;
    frame.size.height = height;
    textfield.frame = frame;
}


@end
