//
//  StatusViewController.h
//  AdminForeSight
//
//  Created by Ross Freiman on 7/25/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatusCell.h"

@interface StatusViewController : UIViewController <UITextViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *statusTextView;
@property (weak, nonatomic) IBOutlet UILabel *numCharacters;

@property (nonatomic, assign) IBOutlet UIView *accessoryView;

@property (nonatomic, strong) NSMutableArray *statusList;


-(IBAction)textViewDoneTyping;
-(IBAction)goBack;

@end
