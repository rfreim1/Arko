//
//  OptionCell.m
//  AdminForeSight
//
//  Created by Bhaskar Ravi on 7/25/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "OptionCell.h"

@implementation OptionCell

@synthesize button;

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
