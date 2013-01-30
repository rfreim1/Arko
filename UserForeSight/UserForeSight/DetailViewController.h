//
//  DetailViewController.h
//  UserForeSight
//
//  Created by Ross Freiman on 7/23/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreData.h"
#import "CommentCell.h"
#import "StatusCell.h"
#import "CommentData.h"
#import "StatusData.h"
@interface DetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UILabel *storeName;

@property (weak, nonatomic) IBOutlet UILabel *busyStatusLabel;
@property (weak, nonatomic) IBOutlet UITextView *statusText;
@property (weak, nonatomic) IBOutlet UILabel *statusUpdatedLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;


@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIView *notifyView;
@property (weak, nonatomic) IBOutlet UITableView *commentTable;
@property (weak, nonatomic) IBOutlet UITableView *statusTable;
@property (weak, nonatomic) IBOutlet UITableView *hoursTable;



@property (strong, nonatomic) StoreData* store;

- (IBAction)pressBack;
- (IBAction)pressStatusBtn;
- (IBAction)pressCommentViewBtn;
- (IBAction)pressNotifyViewBtn;
- (IBAction)pressInfoViewBtn;
- (IBAction)pressAddCommentBtn;

- (IBAction)pressMapBtn;
- (IBAction)pressCallBtn;
- (IBAction)pressWebBtn;



@end
