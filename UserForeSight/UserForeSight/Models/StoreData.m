//
//  StoreData.m
//  ForeSight
//
//  Created by Ross Freiman on 7/13/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "StoreData.h"

@implementation StoreData

@synthesize title = _title;
@synthesize address = _address;
@synthesize phoneNumber = _phoneNumber;
@synthesize website = _website;
@synthesize hours = _hours;


@synthesize busyness = _busyness;
@synthesize busyText = _busyText;
@synthesize busyColor = _busyColor;

@synthesize statuses = _statuses;
@synthesize comments = _comments;
@synthesize closedDays = _closedDays; 


-(id)initWithTitle:(NSString *)title address:(NSString *)address phoneNumber:(NSString *)phoneNumber hours:(NSMutableArray *)hours busyness:(int)busyness statuses:(NSMutableArray *)statuses comments:(NSMutableArray *)comments{
    if (self = [super init]) {
        self.title = title;
        self.address = address;
        self.phoneNumber = phoneNumber;
        self.hours = hours;
        self.busyness = busyness;
        self.statuses = statuses;
        self.comments = comments;
        [self checkBusyness:busyness];
    }
    
    return self;
}

-(void)initOptionalWebsite:(NSString *) website closedDays:(NSMutableArray *)closedDays{
    self.website = website;
    self.closedDays = closedDays;
}


-(void)checkBusyness:(int) busyness{
    if (self.busyness == 3) {
        self.busyText = @"not busy";
        //creates green color for busyness text
        self.busyColor = [UIColor colorWithRed:88.0f/255.0f green:147.0f/255.0f blue:42.0f/255.0f alpha:1.0f];
    }
    else if (self.busyness == 2) {
        self.busyText = @"medium";
        self.busyColor = [UIColor colorWithRed:205.0f/255.0f green:103.0f/255.0f blue:0.0f alpha:1.0f];
    }
     else if (self.busyness == 1) {
        self.busyText = @"packed";
        self.busyColor = [UIColor colorWithRed:143.0f/255.0f green:44.0f/255.0f blue:50.0f/255.0f alpha:1.0f];
    }
    else {
        self.busyText = @"closed";
        self.busyColor = [UIColor grayColor];
    }
}


-(NSComparisonResult)sortByName:(StoreData*)otherStore{
    if(otherStore){
        return [self.title compare:otherStore.title];
    }
    return NSOrderedSame;
}

-(NSComparisonResult)sortByBusyness:(StoreData*)otherStore{
    if (self.busyness < otherStore.busyness) {
        return NSOrderedDescending;
    }
    else if(self.busyness > otherStore.busyness){
        return NSOrderedAscending;
    }
    return NSOrderedSame;
}

@end
