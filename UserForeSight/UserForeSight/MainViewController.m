//
//  MainViewController.m
//  UserForeSight
//
//  Created by Ross Freiman on 7/23/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "MainViewController.h"

#import "HelperFunctions.h"
#import "DetailViewController.h"
#import "UserProfileViewController.h"

@interface MainViewController (){
    int sort;
}

@end

@implementation MainViewController

@synthesize storeList = _storeList;
@synthesize dropDownView = _dropDownView;
@synthesize logInMenu = _logInMenu;
@synthesize user = _user;
@synthesize tableView = _tableView;
@synthesize menuBtn = _menuBtn;
@synthesize dropDownMenu = _dropDownMenu;
@synthesize SignUpMenu = _SignUpMenu;
@synthesize loggedInDropDownMenu = _loggedInDropDownMenu;
@synthesize usernameSignUpText = _usernameSignUpText;
@synthesize passwordSignUpText = _passwordSignUpText;
@synthesize emailSignUpText = _emailSignUpText;
@synthesize logInUsernameText = _logInUsernameText;
@synthesize loginPasswordText = _loginPasswordText;

#pragma mark - Initializations
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


#pragma mark - View SetUps

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSubviews];
    [self.view addSubview:self.dropDownView];

	//Do any additional setup after loading the view.
}


- (void)viewDidUnload
{
    [self setTableView:nil];
    [self setDropDownView:nil];
    [self setDropDownMenu:nil];
    [self setSignUpMenu:nil];
    [self setTableView:nil];
    [self setMenuBtn:nil];
    [self setUsernameSignUpText:nil];
    [self setPasswordSignUpText:nil];
    [self setEmailSignUpText:nil];
    [self setLogInUsernameText:nil];
    [self setLoginPasswordText:nil];
    [self setLogInMenu:nil];
    [self setLoggedInDropDownMenu:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



-(void)initSubviews{
    //setup subviews alpha and interaction
    [self.dropDownView setAlpha:0.0f];
    [self.dropDownMenu setAlpha:0.0f];
    [self.SignUpMenu setAlpha:0.0f];
    [self.logInMenu setAlpha:0.0f];
    [self.loggedInDropDownMenu setAlpha:0.0f];
    [self.dropDownView setUserInteractionEnabled:NO];
    
    //set up signin textfields with proper height
    HelperFunctions *h  =[[HelperFunctions alloc] init];
    [h changeTextfield:self.loginPasswordText height:44];
    [h changeTextfield:self.logInUsernameText height:44];
    [h changeTextfield:self.usernameSignUpText height:44];
    [h changeTextfield:self.passwordSignUpText height:44];
    [h changeTextfield:self.emailSignUpText height:44];
}
    
#pragma mark- Helper Functions

-(void)showErrorInTextField: (UITextField *)textfield{
    textfield.layer.cornerRadius = 4.0f;
    textfield.layer.masksToBounds = YES;
    textfield.layer.borderWidth = 1.0f;
    textfield.layer.borderColor = [[UIColor redColor] CGColor];
}


#pragma mark- TextField Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES; 
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.storeList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section/stores in location.
    NSDictionary *dictionary = [self.storeList objectAtIndex:section];
    NSMutableArray *array = [dictionary objectForKey:@"stores"];
    
    return [array count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"StoreCell";
    StoreCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //sets up to get the storedata from dictionary of arrays of stores
    NSMutableDictionary *dictionary = [self.storeList objectAtIndex:indexPath.section];
    NSMutableArray *array = [dictionary objectForKey:@"stores"];
    
    
    //sorts array and sets storelist to new sorted array
    if (sort == 0) {
        array = (NSMutableArray*)[array sortedArrayUsingSelector:@selector(sortByName:)];
    }
    else {
        array = (NSMutableArray*)[array sortedArrayUsingSelector:@selector(sortByBusyness:)];
    }
    [dictionary setObject:array forKey:@"stores"];
    [self.storeList replaceObjectAtIndex:indexPath.section withObject:dictionary];
    
    
    //gets store data
    StoreData *data = [array objectAtIndex:indexPath.row];
    
    //sets up what the labels on cell say// 
    cell.storeNameLabel.text = data.title;
    cell.statusLabel.text = data.busyText;
    cell.statusLabel.textColor = data.busyColor;
    
    if (data.busyness == 3) {
        [cell.sideBarImage setImage:[UIImage imageNamed:@"bar_green"]];
    }
    else if (data.busyness == 2) {
        [cell.sideBarImage setImage:[UIImage imageNamed:@"bar_orange"]];
    }
    else if (data.busyness == 1) {
        [cell.sideBarImage setImage:[UIImage imageNamed:@"bar_red"]];
    }
    else {
        [cell.sideBarImage setImage:[UIImage imageNamed:@"bar_black"]];
    }
    
    cell.updatedTimeLabel.text = @"5 minute ago";
    
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
     
}


-(void)viewDidAppear:(BOOL)animated{
    //dehighlights cell after it returns from detail view
    NSIndexPath *selected = [self.tableView indexPathForSelectedRow];
    if (selected) {
        [self.tableView deselectRowAtIndexPath:selected animated:YES];
    }
    
    //removes backgroundView and shows MainView first
    //****May Remove if should disappear BGview first once btn is pressed****//
    [self pushBtnGoBackToMainView];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"ShowStore"]) {
        DetailViewController *detailController = segue.destinationViewController;
        
        NSDictionary *dictionary = [self.storeList objectAtIndex:self.tableView.indexPathForSelectedRow.section];
        NSMutableArray *array = [dictionary objectForKey:@"stores"];
        
        StoreData *store = [array objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        detailController.store = store;
    }
    else if ([[segue identifier] isEqualToString:@"ShowUserProfile"]) {
        UserProfileViewController *profileController = segue.destinationViewController;
        profileController.user = self.user;
        
    }
}

//animates table changes when it reloads
-(void)AnimateTableReload{
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}


- (IBAction)pushBtnDropDown {
    self.dropDownView.alpha = 1.0f;
    if (self.user == nil) {
        self.dropDownMenu.alpha = 1.0f;
        [self.dropDownMenu fadeIn:.5 delegate:self];
    }
    else {
        self.loggedInDropDownMenu.alpha = 1.0f;
        [self.loggedInDropDownMenu fadeIn:.5 delegate:self];
    }
        
    [self.dropDownView fadeIn:.5 delegate:self];
    [self.dropDownView setUserInteractionEnabled:YES];

}

#pragma mark - Sorting Button actions
//sorting btn calls change variable value and refresh table to get new 
- (IBAction)pushBtnNameSort:(id)sender {
    sort = 0; 
    [self AnimateTableReload];
}

- (IBAction)pushBtnBusySort:(id)sender {
    sort = 1;
    [self AnimateTableReload];
}

#pragma mark - DropDown Menu Button Actions

- (IBAction)showSignUp {
    self.SignUpMenu.alpha = 1.0f;
    self.dropDownMenu.alpha = 0.0f;
    NSLog(@"show signup");
}


- (IBAction)showLogIn {
    self.logInMenu.alpha = 1.0f;
    [self.dropDownMenu fadeOut:.5 delegate:self];
    [self.logInMenu fallIn:.5 delegate:self];
    NSLog(@"show login");
    
    
    
}

- (IBAction)pushShowFeedbackView {
    [self pushBtnGoBackToMainView];
}

- (IBAction)pushShowAboutView {
}


#pragma mark - Background Button
-(void)pushBtnGoBackToMainView{
    self.dropDownView.alpha = 0.0f;
    self.SignUpMenu.alpha = 0.0f;
    self.dropDownMenu.alpha = 0.0f;
    [self.dropDownView setUserInteractionEnabled:NO];
}

@end
