//
//  StatusCell.m
//  UserForeSight
//
//  Created by Ross Freiman on 8/19/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "StatusCell.h"

@implementation StatusCell

@synthesize statusLabel = _statusLabel;
@synthesize postTimeLabel = _postTimeLabel;

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
