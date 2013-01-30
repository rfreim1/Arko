//
//  MainViewController.m
//  AdminForeSight
//
//  Created by Ross Freiman on 7/23/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "MainViewController.h"
#import "StatusData.h"

@interface MainViewController ()

@property NSArray *menuOptions;

@end

@implementation MainViewController
@synthesize numUpdateRequests = _numUpdateRequests;
@synthesize timeToUpdate = _timeToUpdate;
@synthesize dropDownView = _dropDownView;
@synthesize tableView = _tableView;
@synthesize menuOptions = _menuOptions;
@synthesize statusList= _statusList;


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
    self.dropDownView.alpha = 0.0f;
    [self setUpMenuOptions];
    
    [self setUpNavBar];
    
    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setNumUpdateRequests:nil];
    [self setTimeToUpdate:nil];
    [self setDropDownView:nil];
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


-(void)setUpNavBar{
    //setup title
    UILabel* lbNavTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    lbNavTitle.textAlignment = UITextAlignmentLeft;
    lbNavTitle.text = @"foresight";
    lbNavTitle.textColor = [UIColor greenColor];
    lbNavTitle.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = lbNavTitle;
    
    //setup menu button
    UIImage *menu_image = [UIImage imageNamed:@"menu_button"];
    
    UIButton *menu_button = [UIButton buttonWithType:UIButtonTypeCustom];
    menu_button.bounds = CGRectMake(0, 0, menu_image.size.width, menu_image.size.height);
    [menu_button setImage:menu_image forState:UIControlStateNormal];
    [menu_button addTarget:self action:@selector(dropDownMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:menu_button];
    
    self.navigationItem.rightBarButtonItem = barButton;
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)dropDownMenu:(id)sender {
    self.dropDownView.alpha = 1.0f;
}

-(void)viewDidAppear:(BOOL)animated{
    //dehighlights cell after it returns from detail view
    NSIndexPath *selected = [self.tableView indexPathForSelectedRow];
    if (selected) {
        [self.tableView deselectRowAtIndexPath:selected animated:YES];
    }
    //removes backgroundView and shows MainView first
    //****May Remove if should disappear BGview first once btn is pressed****//
    [self pushRtnToMainView];
    [super viewDidAppear:animated];
    
    
}

- (IBAction)pushRtnToMainView {
    self.dropDownView.alpha = 0.0f;
}

- (IBAction)pushMenuBtn_GoToView:(UIButton*)sender {

}

-(void)setUpMenuOptions{
    NSString *status = @"status";
    NSString *account = @"account";
    NSString *options = @"options";
    NSString *about = @"about";
    
    NSArray *array = [[NSArray alloc] initWithObjects: status, account, options, about, nil];
    self.menuOptions = array;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections/locations added.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"dumb");
    return [self.menuOptions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //sets up our custom cell
    OptionCell *cell = (OptionCell *)[tableView dequeueReusableCellWithIdentifier:@"OptionCell"];
    //sets up button text
    [cell.button setTitle:[self.menuOptions objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"ToStatusView"]) {
        
        StatusViewController *statusController = segue.destinationViewController;
        statusController.statusList = self.statusList;
    }
    self.dropDownView.alpha = 0.0f;    
}


@end
