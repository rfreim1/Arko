//
//  AppDelegate.m
//  AdminForeSight
//
//  Created by Ross Freiman on 7/22/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "AppDelegate.h"
#import "StatusData.h"
#import "MainViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    StatusData *currStat = [[StatusData alloc] initWithStatusText:@"closing 5 minutes" postTime:@"3 hrs ago"];
    StatusData *pastStat1 = [[StatusData alloc] initWithStatusText:@"opening in 24 minutes" postTime:@"10 hrs ago" ];
    StatusData *pastStat2 = [[StatusData alloc] initWithStatusText:@"Grand Opening Today! Get free pizzas for everyone in the town you choose to crayon with!" postTime:@"2 months ago"];
    
    NSMutableArray *pastStatuses = [NSMutableArray arrayWithObjects:pastStat1, pastStat2, nil];
    NSMutableArray *currentStatus = [NSMutableArray arrayWithObject:currStat];
    
    NSDictionary *statuses = [NSDictionary dictionaryWithObject:pastStatuses forKey:@"status"];
    NSDictionary *currStatus = [NSDictionary dictionaryWithObject:currentStatus forKey:@"status"];
    
    NSMutableArray *status = [NSMutableArray arrayWithObjects:currStatus, statuses, nil];
    //NSMutableArray *status = [NSMutableArray arrayWithObjects:currentStatus, pastStatuses, nil];
    
    UINavigationController * navController = (UINavigationController *) self.window.rootViewController;
    StatusViewController *master =[navController.viewControllers objectAtIndex:0];
    master.statusList = status;
    
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
