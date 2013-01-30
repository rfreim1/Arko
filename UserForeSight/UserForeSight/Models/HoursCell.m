//
//  HoursCell.m
//  UserForeSight
//
//  Created by Ross Freiman on 8/25/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "HoursCell.h"

@implementation HoursCell

@synthesize hoursLabel = _hoursLabel;
@synthesize dayLabel = _dayLabel;

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
