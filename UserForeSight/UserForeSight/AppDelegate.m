//
//  AppDelegate.m
//  ForeSight
//
//  Created by Ross Freiman on 7/13/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "AppDelegate.h"
#import "StoreData.h"
#import "MainViewController.h"
#import "User.h"
#import "StatusData.h"
#import "CommentData.h"
#import "BusinessHours.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //dummy user
    User *user =[[User alloc] initWithUserName:@"Joge12" password:@"1234" email:@"sauceboss@gmail.com"];
    
    
    //dummy statuses
   StatusData *currStat = [[StatusData alloc] initWithStatusText:@"we're going to be closing at 6pm tonight due to the storm" postTime:@"1d ago"];
    StatusData *pastStat1 = [[StatusData alloc] initWithStatusText:@"try our new summer special: the raspberry mocha freddo!" postTime:@"5d ago" ];
    StatusData *pastStat2 = [[StatusData alloc] initWithStatusText:@"Grand Opening Today! Get free pizzas for everyone in the town you choose to crayon with!" postTime:@"2mo ago"];
    
    NSMutableArray *statuses = [NSMutableArray arrayWithObjects:currStat, pastStat1, pastStat2, nil];
    
    //dummy comments
    CommentData *comment1 = [[CommentData alloc] initWithText:@"cool place to get good coffee and get some light work done. It does get a bit loud when crowded tho" postTime:[[NSDate alloc] init]authorName: user.userName];
    CommentData *comment2 = [[CommentData alloc] initWithText:@"great atmosphere and vibe" postTime:[[NSDate alloc] init]authorName: user.userName];
    CommentData *comment3 = [[CommentData alloc] initWithText:@"best place to get a burger in Evanston" postTime:[[NSDate alloc] init]authorName: user.userName];
    CommentData *comment4 = [[CommentData alloc] initWithText:@"best music" postTime:[[NSDate alloc] init]authorName: user.userName];

    NSMutableArray *comments = [NSMutableArray arrayWithObjects:comment1, comment2, comment3, comment4, nil];
    
    //dummy hours
    BusinessHours *day1 = [[BusinessHours alloc] initHoursOpening:@"8am" closing:@"8pm"];
    BusinessHours *day2 = [[BusinessHours alloc] initHoursOpening:@"10am" closing:@"10pm"];
    BusinessHours *day3 = [[BusinessHours alloc] initHoursOpening:@"10am" closing:@"8pm"];
    BusinessHours *day4 = [[BusinessHours alloc] initHoursOpening:@"8am" closing:@"8pm"];
    BusinessHours *day5 = [[BusinessHours alloc] initHoursOpening:@"8am" closing:@"6pm"];
    BusinessHours *day6 = [[BusinessHours alloc] initHoursOpening:@"8am" closing:@"5pm"];
    BusinessHours *day7 = [[BusinessHours alloc] initHoursOpening:@"8am" closing:@"11:30am"];
    
    NSMutableArray *hours = [NSMutableArray arrayWithObjects: day1, day2, day3, day4, day5, day6, day7, nil];
    
    //dummy stores
    StoreData *store1= [[StoreData alloc] initWithTitle:@"Kafein" address:@"1596 Sherman Ave,\nEvanston IL, 60201" phoneNumber:@"(847)864-6909" hours:hours busyness:1 statuses:statuses comments:comments];
    StoreData *store2 = [[StoreData alloc] initWithTitle:@"Argo" address:@"1596 Sherman Ave\nEvanston, IL\n60201" phoneNumber:@"(847)864-6909" hours:hours busyness:2 statuses:statuses comments:comments];
    StoreData *store3 = [[StoreData alloc] initWithTitle:@"Barnes & Noble" address:@"1596 Sherman Ave,\nEvanston IL,\n60201" phoneNumber:@"(847)864-6909" hours:hours busyness:3 statuses:statuses comments:comments];
    StoreData *store4 = [[StoreData alloc] initWithTitle:@"BabyBottle Pop" address:@"1596 Sherman Ave\n(Between Davis St. & Orrington\nEvanston, IL 60201" phoneNumber:@"(847)864-6909" hours:hours busyness:0 statuses:statuses comments:comments];
    
    [store2 initOptionalWebsite:@"www.argotea.com" closedDays:nil];
    [store3 initOptionalWebsite:@"www.barnesandnoble.com" closedDays:nil];
    
    NSMutableArray *stores = [NSMutableArray arrayWithObjects:store1, store2, store3, store4, nil];
    
    
    

    /*
     //dummy elsewhere stores
     NSMutableArray *elsewhere = [NSMutableArray arrayWithObjects:lennys, potbellys, nil];
     NSDictionary *storesElsewhere = [NSDictionary dictionaryWithObject:elsewhere forKey:@"stores"];
     */
    
    NSMutableDictionary *storesAtNorthwestern = [NSMutableDictionary dictionaryWithObject:stores forKey:@"stores"];
    
    //Add another dictionary to get different sections
    NSMutableArray *listOfStores = [[NSMutableArray alloc] initWithObjects:storesAtNorthwestern, nil];
    
    UINavigationController * navController = (UINavigationController *) self.window.rootViewController;
    MainViewController *master =[navController.viewControllers objectAtIndex:0];
    master.storeList = listOfStores;
    
    master.user = user;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
