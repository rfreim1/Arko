//
//  TabCell.h
//  UserForeSight
//
//  Created by Ross Freiman on 7/18/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabCell : UITableViewCell

@property (weak, nonatomic)IBOutlet UISegmentedControl *menu;


/*
 //In case of using 3 buttons instead
 @property (weak, nonatomic)IBOutlet UIButton nameBtn;
 @property (weak, nonatomic)IBOutlet UIButton distanceBtn;
 @property (weak, nonatomic)IBOutlet UIButton statusBtn;
 */

@end
