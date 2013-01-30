//
//  FeedBackViewController.h
//  UserForeSight
//
//  Created by Ross Freiman on 7/25/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedBackViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UIView *placeFeedbackView;
@property (weak, nonatomic) IBOutlet UITextView* textview;
@property (weak, nonatomic) IBOutlet UITextField *storeNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *storeAddressTextField;

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;


- (IBAction)placeBtnPushed;
- (IBAction)textBtnPushed;

- (IBAction)pressConfirm;
- (IBAction)pressCancel;
- (IBAction)pressBack;

@end
