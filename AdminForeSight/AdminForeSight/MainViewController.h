//
//  MainViewController.h
//  AdminForeSight
//
//  Created by Ross Freiman on 7/23/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionCell.h"
#import "StatusViewController.h"

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *numUpdateRequests;
@property (weak, nonatomic) IBOutlet UILabel *timeToUpdate;
@property (weak, nonatomic) IBOutlet UIView *dropDownView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong,nonatomic) NSMutableArray *statusList;



- (IBAction)dropDownMenu:(id)sender;
- (IBAction)pushRtnToMainView;
- (IBAction)pushMenuBtn_GoToView:(id)sender;


@end
