//
//  StatusCell.h
//  AdminForeSight
//
//  Created by Ross Freiman on 7/31/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *postTimeLabel;

@end
