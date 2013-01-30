//
//  AddCommentViewController.m
//  UserForeSight
//
//  Created by Ross Freiman on 8/21/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "AddCommentViewController.h"
#import "DetailViewController.h"
#import "CommentData.h"

@interface AddCommentViewController ()

@end

@implementation AddCommentViewController
@synthesize numCharactersLabel = _numCharactersLabel;
@synthesize commentTextView = _commentTextView;
@synthesize detailViewController = _detailViewController;

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
	[self.commentTextView becomeFirstResponder];
}

- (void)viewDidUnload
{
    [self setNumCharactersLabel:nil];
    [self setCommentTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.commentTextView becomeFirstResponder];
    self.commentTextView.text = @"";
}

- (IBAction)pressConfirm {
    [self.commentTextView resignFirstResponder];
    
    if (![self.commentTextView.text isEqualToString:@""]) {
        CommentData *comment = [[CommentData alloc] initWithText:self.commentTextView.text postTime:[NSDate date] authorName:@"hello"];
        [self.detailViewController.store.comments insertObject:comment atIndex:0];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)pressCancel {
    [self.commentTextView resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - TextView Delegate

-(void)textViewDidChange:(UITextView *)textView{
    self.numCharactersLabel.text = [NSString stringWithFormat: @"%i",[[textView text] length]];
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
@end
