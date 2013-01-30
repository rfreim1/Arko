//
//  StatusViewController.m
//  AdminForeSight
//
//  Created by Ross Freiman on 7/25/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "StatusViewController.h"
#import "StatusData.h"

@interface StatusViewController ()

@end

@implementation StatusViewController


@synthesize statusList = _statusList;
@synthesize statusTextView;
@synthesize numCharacters;
@synthesize accessoryView;

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
    statusTextView.textColor = [UIColor lightGrayColor];
    [self setUpNavBar];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setStatusTextView:nil];
    [self setNumCharacters:nil];
    [self setAccessoryView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void)setUpNavBar{
    //setup title
    self.navigationItem.title = @"status";
    
    //setup buttons
    
    //back button
    UIImage *back_image = [UIImage imageNamed:@"back"];
    UIButton *back_button = [UIButton buttonWithType:UIButtonTypeCustom];
    back_button.bounds = CGRectMake(0, 0, back_image.size.width, back_image.size.height);
    [back_button setImage:back_image forState:UIControlStateNormal];
    [back_button addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:back_button];
    
    self.navigationItem.leftBarButtonItem = barButton;
    
    //remove status button
    
    UIImage *cancel_image = [UIImage imageNamed:@"cancel"];
    UIButton *cancel_button = [UIButton buttonWithType:UIButtonTypeCustom];
    cancel_button.bounds = CGRectMake(0, 0, cancel_image.size.width, cancel_image.size.height);
    [cancel_button setImage:cancel_image forState:UIControlStateNormal];
    [cancel_button addTarget:self action:@selector(cancelStatus) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barButton2 = [[UIBarButtonItem alloc] initWithCustomView:cancel_button];
    
    self.navigationItem.rightBarButtonItem = barButton2;

    
}


-(void)goBack{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - TextView Delegate Methods

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    if (textView.textColor == [UIColor lightGrayColor]){
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    
    
    if(textView.inputAccessoryView == nil){
        [[NSBundle mainBundle] loadNibNamed:@"KeyboardAccessory" owner:self options:nil];
        // Loading the AccessoryView nib file sets the accessoryView outlet.
        textView.inputAccessoryView = accessoryView;    
        // After setting the accessory view for the text view, we no longer need a reference to the accessory view.
        self.accessoryView = nil;
    }
    return YES;
}

-(void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length == 0) {
        textView.textColor = [UIColor lightGrayColor];
        textView.text = @"what's up?";
        [textView resignFirstResponder];
    }
    self.numCharacters.text = [NSString stringWithFormat: @"%i",[[textView text] length]];
}


-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    int limit = 140;
    
    if (range.length > text.length){
        return YES;
    }
    else if ([[textView text] length] + text.length > limit) {
        return NO;
    }
    return YES;
    
}


-(void)textViewDoneTyping{
    [self.statusTextView resignFirstResponder];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    NSLog(@"%i",[self.statusList count]);
    return [self.statusList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section/stores in location.
    NSDictionary *dictionary = [self.statusList objectAtIndex:section];
    NSMutableArray *array = [dictionary objectForKey:@"status"];
    
    return [array count];
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"Current";
    }
    else {
        return @"Past";
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //sets up to get the storedata from dictionary of arrays of stores
    NSMutableDictionary *dictionary = [self.statusList objectAtIndex:indexPath.section];
    NSMutableArray *array = [dictionary objectForKey:@"status"];
    
    StatusData *data = [array objectAtIndex:indexPath.row];
    
    CGSize constraint = CGSizeMake(291 - 20, 2000.0f);
    CGSize size = [data.statusText sizeWithFont:[UIFont fontWithName:@"Helvetica Neue" size:16.0f] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    
    CGFloat height = MAX(size.height + 22, 44.0f);
    NSLog(@"%f", height);
    return height;

    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"statusCell";
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //sets up to get the storedata from dictionary of arrays of stores
    NSMutableDictionary *dictionary = [self.statusList objectAtIndex:indexPath.section];
    NSMutableArray *array = [dictionary objectForKey:@"status"];
    
    StatusData *data = [array objectAtIndex:indexPath.row];
    
    //sets up what the labels on cell say//
    cell.statusLabel.text = data.statusText;
    [cell.statusLabel sizeToFit];
    cell.postTimeLabel.text = data.postTime;
 
    //set up label positions
    [cell.postTimeLabel setFrame:CGRectMake(cell.postTimeLabel.frame.origin.x, cell.statusLabel.frame.size.height+3, cell.postTimeLabel.frame.size.width, cell.postTimeLabel.frame.size.height)];
    
    
    
    return cell;
}

@end
