//
//  TabCell.m
//  UserForeSight
//
//  Created by Ross Freiman on 7/18/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "TabCell.h"

@implementation TabCell

@synthesize menu = _menu;

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
