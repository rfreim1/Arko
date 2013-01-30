//
//  StoreCell.h
//  ForeSight
//
//  Created by Ross Freiman on 7/13/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreCell : UITableViewCell

//sets up labels for custom table cell
@property (nonatomic, weak) IBOutlet UILabel *storeNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *statusLabel;
@property (nonatomic, weak) IBOutlet UILabel *updatedTimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sideBarImage;

@end
