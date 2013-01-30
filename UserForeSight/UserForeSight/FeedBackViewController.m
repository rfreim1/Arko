//
//  FeedBackViewController.m
//  UserForeSight
//
//  Created by Ross Freiman on 7/25/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "FeedBackViewController.h"
#import "HelperFunctions.h"


@interface FeedBackViewController ()

@end

@implementation FeedBackViewController{

}

@synthesize placeFeedbackView = _placeFeedbackView;
@synthesize textview = _textview;
@synthesize storeNameTextField = _storeNameTextField;
@synthesize storeAddressTextField = _storeAddressTextField;
@synthesize cancelBtn = _cancelBtn;
@synthesize confirmBtn = _confirmBtn;
@synthesize backBtn = _backBtn;

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
    [self initSubViews];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setStoreNameTextField:nil];
    [self setStoreAddressTextField:nil];
    [self setPlaceFeedbackView:nil];
    [self setCancelBtn:nil];
    [self setConfirmBtn:nil];
    [self setBackBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void)initSubViews{
    self.textview.textColor = [UIColor lightGrayColor];
    
    //set heights of textfields
    HelperFunctions *h = [[HelperFunctions alloc] init];
    [h changeTextfield:self.storeNameTextField height:44.0f];
    [h changeTextfield:self.storeAddressTextField height:44.0f];
}


#pragma mark - TextView Delegate Methods

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    if (textView.textColor == [UIColor lightGrayColor]){
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    return YES;
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    self.confirmBtn.hidden = NO;
    self.cancelBtn.hidden = NO;
    self.backBtn.hidden = YES;
    
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length == 0) {
        textView.textColor = [UIColor lightGrayColor];
        textView.text = @"tell us what's on your mind...";
    }
    self.backBtn.hidden = NO;
    self.confirmBtn.hidden = YES;
    self.cancelBtn.hidden = YES;
}

#pragma mark - TextField Delegate Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    self.backBtn.hidden = NO;
    self.confirmBtn.hidden = YES;
    self.cancelBtn.hidden = YES;
    
    return YES;
}


#pragma mark - Button Functions
- (IBAction)pressConfirm {
    if (self.textview.hidden == NO){
        [self.textview resignFirstResponder];
    
        if (self.textview.text.length > 10){
        
        }
    }
    else {
        [self.storeNameTextField resignFirstResponder];
        [self.storeAddressTextField resignFirstResponder];
    }
    //send some signal to say confirm
}

- (IBAction)pressCancel {
    if (self.textview.hidden == NO){
        [self.textview resignFirstResponder];
    }
    else{
        [self.storeNameTextField resignFirstResponder];
        [self.storeAddressTextField resignFirstResponder];
    }
    
}

-(IBAction)pressBack{
    if (self.backBtn.hidden == NO){
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (IBAction)placeBtnPushed {
    self.textview.hidden = YES;
    self.textview.userInteractionEnabled = NO;
    self.placeFeedbackView.hidden = NO;
    self.placeFeedbackView.userInteractionEnabled = YES;
    
}

- (IBAction)textBtnPushed {
    self.textview.hidden = NO;
    self.textview.userInteractionEnabled = YES;
    self.placeFeedbackView.hidden = YES;
    self.placeFeedbackView.userInteractionEnabled = NO;
}



@end
