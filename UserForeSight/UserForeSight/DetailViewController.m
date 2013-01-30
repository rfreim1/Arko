//
//  DetailViewController.m
//  UserForeSight
//
//  Created by Ross Freiman on 7/23/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "DetailViewController.h"
#import "AddCommentViewController.h"
#import "HoursCell.h"
#import "BusinessHours.h"

@interface DetailViewController ()

@end

@implementation DetailViewController{
    NSArray *hoursArray;
}

@synthesize storeName;
@synthesize busyStatusLabel;
@synthesize statusText;
@synthesize statusUpdatedLabel;
@synthesize addressLabel;
@synthesize phoneNumLabel;
@synthesize websiteLabel;
@synthesize infoView;
@synthesize notifyView;
@synthesize commentTable;
@synthesize statusTable;
@synthesize hoursTable;
@synthesize store = _store;


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
    self.storeName.text = self.store.title;
    
    self.busyStatusLabel.textColor = self.store.busyColor;
    self.busyStatusLabel.text = self.store.busyText;
    
    [self initSubViews];
    
    hoursArray = [NSArray arrayWithObjects:@"Monday",@"Tuesday",@"Wednesday", @"Thursday", 
                  @"Friday", @"Saturday", @"Sunday", nil];
    
    ///******//Stuff to set up other items when actually filled out
    //self.statusText.text = self.store.status (need to change status to busyness in model)
    //self.statusUpdatedLabel.text = self.store.statusUpdate
    
}

- (void)viewDidUnload
{
    [self setStoreName:nil];
    [self setBusyStatusLabel:nil];
    [self setStatusText:nil];
    [self setStatusUpdatedLabel:nil];
    [self setNotifyView:nil];
    [self setCommentTable:nil];
    [self setStatusTable:nil];
    [self setAddressLabel:nil];
    [self setPhoneNumLabel:nil];
    [self setWebsiteLabel:nil];
    [self setInfoView:nil];
    [self setHoursTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



-(void)initSubViews
{
    [self.notifyView setHidden:YES];
    [self.commentTable setHidden:YES];
    [self.infoView setHidden:YES];
    
    [self.notifyView setUserInteractionEnabled:NO];
    [self.commentTable setUserInteractionEnabled:NO];
    [self.infoView setUserInteractionEnabled:NO];
    
    self.addressLabel.text = self.store.address;
    self.phoneNumLabel.text = self.store.phoneNumber;
    
    if (self.store.website != nil){
        self.websiteLabel.text = self.store.website;
    }
    else {
        self.websiteLabel.text = @"No Website Available";
    }
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section/stores in location.
    switch (tableView.tag) {
        case 1:
            NSLog(@"comment #: %d", self.store.comments.count);
            return [self.store.comments count];
            break;
            
        case 2:
            NSLog(@"status #: %d", self.store.statuses.count);
            return [self.store.statuses count];
            break;
        case 3:
            return 7;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 2) {
        StatusCell *statusCell = [tableView dequeueReusableCellWithIdentifier:@"StatusCell"];
        StatusData *data = [self.store.statuses objectAtIndex:indexPath.row];
        statusCell.statusLabel.text = data.statusText;
        statusCell.postTimeLabel.text = data.postTime;
        return statusCell;
    }
    else if (tableView.tag == 1){
        CommentCell *commentCell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
        CommentData *data = [self.store.comments objectAtIndex:indexPath.row];
        commentCell.commentLabel.text = data.commentText;
        commentCell.authorLabel.text = data.authorName;
        commentCell.postTimeLabel.text = [self findIntervalSincePostTime:data.postTime];
        return commentCell;
    }
    else {
        HoursCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HourCell"];
        cell.dayLabel.text = [hoursArray objectAtIndex:indexPath.row];
        BusinessHours *hours = [self.store.hours objectAtIndex:indexPath.row];
        cell.hoursLabel.text = [NSString stringWithFormat:@"%@ - %@", hours.openingTime, hours.closingTime];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];  
        [dateFormatter setDateFormat:@"EEEE"];
        
        if ([cell.dayLabel.text isEqualToString:[dateFormatter stringFromDate:[NSDate date]]]){
            UIColor *green = [UIColor colorWithRed:88/255.0f green:147/255.0f blue:42/255.0f alpha:1.0f];
            UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
            cell.dayLabel.textColor = green;
            cell.dayLabel.font = font;
            cell.hoursLabel.textColor = green;
            cell.hoursLabel.font = font;
        }
        
        
        return cell;
    }
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"AddComment"]){
        AddCommentViewController *addView = segue.destinationViewController;
        [addView setDetailViewController:self];
    }
}



//finds interval betwen postime and current time
-(NSString*)findIntervalSincePostTime:(NSDate*) postTime{
    NSTimeInterval interval = [postTime timeIntervalSinceNow];
    if (interval < 0) {
        interval = interval * -1;
    }
    //interval less than a minute...print seconds
    if (interval < 60)
    {
        NSLog(@"%f", round(interval));
        int seconds = round(interval);
        return [NSString stringWithFormat:@"%is ago", seconds];
    }
    // is interval less then an hour? print minutes.
    else if (interval < 60 * 60)
    {
        int minutes = round( interval / 60 );
    
        return [NSString stringWithFormat:@"%im ago", minutes];
    }
    else if (interval < 60 * 60 * 24)
    {
        int hours = round( interval / (60 * 60) );

        return [NSString stringWithFormat:@"%ih ago", hours];
    }
    // more then a day? print formatted date.
    else
    {
        int days = round(interval / (60 * 60 * 24));        
        return [NSString stringWithFormat:@"%id ago", days];
    }
}



#pragma mark - Button Presses
- (IBAction)pressBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)pressStatusBtn {
    [self.statusTable setHidden:NO];
    [self.statusTable setUserInteractionEnabled:YES];
    
    [self.notifyView setHidden:YES];
    [self.commentTable setHidden:YES];
    [self.infoView setHidden:YES];
    [self.infoView setUserInteractionEnabled:NO];
    [self.notifyView setUserInteractionEnabled:NO];
    [self.commentTable setUserInteractionEnabled:NO];
}

- (IBAction)pressCommentViewBtn {
    [self.commentTable setHidden:NO];
    [self.commentTable setUserInteractionEnabled:YES];
    
    [self.notifyView setHidden:YES];
    [self.statusTable setHidden:YES];
    [self.infoView setHidden:YES];
    [self.infoView setUserInteractionEnabled:NO];
    [self.notifyView setUserInteractionEnabled:NO];
    [self.statusTable setUserInteractionEnabled:NO];

}

- (IBAction)pressNotifyViewBtn {
    [self.notifyView setHidden:NO];
    [self.notifyView setUserInteractionEnabled:YES];
    
    [self.commentTable setHidden:YES];
    [self.statusTable setHidden:YES];
    [self.infoView setHidden:YES];
    [self.infoView setUserInteractionEnabled:NO];
    [self.commentTable setUserInteractionEnabled:NO];
    [self.statusTable setUserInteractionEnabled:NO];
}

- (IBAction)pressInfoViewBtn {
    [self.infoView setHidden:NO];
    [self.infoView setUserInteractionEnabled:YES];
    
    
    [self.statusTable setHidden:YES];
    [self.notifyView setHidden:YES];
    [self.commentTable setHidden:YES];
    [self.notifyView setUserInteractionEnabled:NO];
    [self.commentTable setUserInteractionEnabled:NO];
    [self.statusTable setUserInteractionEnabled:NO];

}


-(void)viewDidAppear:(BOOL)animated{
    [self.commentTable reloadData];
}

//may set up animation here
- (IBAction)pressAddCommentBtn {

}

//Btns for info tab

- (IBAction)pressMapBtn {
    NSString *url = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", [self.store.address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: url]];
    
}

//need to test on real iphone
- (IBAction)pressCallBtn {
    UIDevice *device = [UIDevice currentDevice];
    NSLog(@"%@", [device model]);
    if ([[device model] isEqualToString:@"iPhone"] ) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%s", self.store.phoneNumber]]];
    } 
    else {
        UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your device doesn't support this feature." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Notpermitted show];
    }
}

- (IBAction)pressWebBtn {
    if (self.store.website != nil) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", self.store.website]];
        [[UIApplication sharedApplication] openURL:url];
        NSLog(@"%@", self.store.website);
    }
}






@end
