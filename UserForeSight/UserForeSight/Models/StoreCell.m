//
//  StoreCell.m
//  ForeSight
//
//  Created by Ross Freiman on 7/13/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "StoreCell.h"

@implementation StoreCell

@synthesize storeNameLabel = _storeNameLabel;
@synthesize statusLabel = _statusLabel;
@synthesize updatedTimeLabel = _updatedTimeLabel;
@synthesize sideBarImage = _sideBarImage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
