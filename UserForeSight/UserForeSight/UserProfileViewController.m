//
//  UserProfileViewController.m
//  UserForeSight
//
//  Created by Ross Freiman on 7/24/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "UserProfileViewController.h"

@interface UserProfileViewController ()

@end

@implementation UserProfileViewController
@synthesize usernameField = _usernameField;
@synthesize passwordField = _passwordField;
@synthesize emailField = _emailField;
@synthesize confirmBtn = _confirmBtn;
@synthesize cancelBtn = _cancelBtn;
@synthesize backBtn = _backBtn;

@synthesize user = _user;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.usernameField.text = self.user.userName;
    self.emailField.text = self.user.email;

	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setUsernameField:nil];
    [self setPasswordField:nil];
    [self setEmailField:nil];
    [self setConfirmBtn:nil];
    [self setCancelBtn:nil];
    [self setBackBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.confirmBtn.hidden = NO;
    self.cancelBtn.hidden = NO;
    self.backBtn.hidden = YES;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)pressBack {
    [self.navigationController popToRootViewControllerAnimated:YES]; 
}

@end
