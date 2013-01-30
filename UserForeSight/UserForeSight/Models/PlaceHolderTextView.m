//
//  PlaceHolderTextView.m
//  UserForeSight
//
//  Created by Ross Freiman on 8/7/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "PlaceHolderTextView.h"

@interface PlaceHolderTextView ()

-(void)_initialize;
-(void)_updateShouldDrawPlaceHolder;
-(void)_textChanged:(NSNotification *)notification;

@end


@implementation PlaceHolderTextView{
    BOOL _shouldDrawPlaceholder;
}

@synthesize placeholder = _placeholder;
@synthesize placeholderColor = _placeholderColor;


-(void)setText:(NSString *)text{
    [super setText:text];
    [self _updateShouldDrawPlaceHolder];
}

-(void)setPlaceholder:(NSString *)placeholder{
    if ([placeholder isEqual:_placeholder]) {
        return;
    }
    [self _updateShouldDrawPlaceHolder];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ((self = [super initWithFrame:frame])) {
        [self _initialize];
    }
    return self;
}


-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    if (_shouldDrawPlaceholder) {
        [_placeholderColor set];
        [_placeholder drawInRect:CGRectMake(8.0f, 8.0f, self.frame.size.width - 16.0f, self.frame.size.height - 16.0f) withFont:self.font];
    }
}

#pragma mark - Private

-(void)_initialize{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_textChanged:) name:UITextViewTextDidChangeNotification object:self];
    
    self.placeholderColor = [UIColor colorWithWhite:.702f alpha:1.0f];
    _shouldDrawPlaceholder = YES;
}

-(void)_updateShouldDrawPlaceHolder{
    BOOL prev = _shouldDrawPlaceholder;
    _shouldDrawPlaceholder = self.placeholder && self.placeholderColor && self.text.length == 0;
    
    if (prev != _shouldDrawPlaceholder) {
        [self setNeedsDisplay];
    }
}

-(void)_textChanged:(NSNotification *)notification{
    [self _updateShouldDrawPlaceHolder];
}


@end
