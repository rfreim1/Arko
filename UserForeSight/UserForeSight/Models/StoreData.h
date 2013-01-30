//
//  StoreData.h
//  ForeSight
//
//  Created by Ross Freiman on 7/13/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoreData : NSObject

//key info about store
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *website;
//Hours of operations (array as sorted, mon/tues/wed/thurs/fri/sat/sun)
@property (nonatomic, strong) NSMutableArray *hours;

//this would be an array of dates when they areclosed...for example, holidays
@property (nonatomic, strong) NSMutableArray *closedDays;

@property (assign) int busyness;
@property (nonatomic, strong) NSString *busyText;
@property (nonatomic, strong) UIColor *busyColor;

//list of status & comments... probably will hold a small number of them...maybe 50 or less depending on latency
@property (nonatomic, strong) NSMutableArray *statuses;
@property (nonatomic, strong) NSMutableArray *comments;
 




//sets up storedata without optional data
-(id)initWithTitle:(NSString *)title address:(NSString*) address phoneNumber:(NSString*)phoneNumber hours:(NSMutableArray*)hours busyness:(int) busyness statuses:(NSMutableArray *)statuses comments:(NSMutableArray *) comments;


-(void)initOptionalWebsite:(NSString *) website closedDays:(NSMutableArray *)closedDays;


//sorting functions
-(NSComparisonResult)sortByName:(id)otherStore;
-(NSComparisonResult)sortByBusyness:(id)otherStore;

@end
