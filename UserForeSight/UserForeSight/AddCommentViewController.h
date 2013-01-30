//
//  AddCommentViewController.h
//  UserForeSight
//
//  Created by Ross Freiman on 8/21/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface AddCommentViewController : UIViewController <UITextViewDelegate>

@property (assign, nonatomic) DetailViewController *detailViewController; 


@property (weak, nonatomic) IBOutlet UILabel *numCharactersLabel;
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;

- (IBAction)pressConfirm;
- (IBAction)pressCancel;

@end
