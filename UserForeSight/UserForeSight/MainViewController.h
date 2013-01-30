//
//  MainViewController.h
//  UserForeSight
//
//  Created by Ross Freiman on 7/23/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreCell.h"
#import "StoreData.h"
#import "User.h"

#import "FTAnimation+UIView.h"

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *storeList;

@property (nonatomic, strong) User* user;


@property (weak, nonatomic) IBOutlet UITableView *tableView;


//background views
@property (weak, nonatomic) IBOutlet UIView *dropDownView;
@property (weak, nonatomic) IBOutlet UIView *logInMenu;
/*may remove */ @property (weak, nonatomic) IBOutlet UIButton *menuBtn;
@property (weak, nonatomic) IBOutlet UIView *dropDownMenu;
@property (weak, nonatomic) IBOutlet UIView *SignUpMenu;
@property (weak, nonatomic) IBOutlet UIView *loggedInDropDownMenu;


//textfields
@property (weak, nonatomic) IBOutlet UITextField *usernameSignUpText;
@property (weak, nonatomic) IBOutlet UITextField *passwordSignUpText;
@property (weak, nonatomic) IBOutlet UITextField *emailSignUpText;
@property (weak, nonatomic) IBOutlet UITextField *logInUsernameText;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordText;


- (IBAction)pushBtnDropDown;
- (IBAction)pushBtnNameSort:(id)sender;
- (IBAction)pushBtnBusySort:(id)sender;

- (IBAction)showSignUp;
- (IBAction)pushShowFeedbackView;
- (IBAction)pushShowAboutView;
- (IBAction)showLogIn;
- (IBAction)pushBtnGoBackToMainView;

@end
