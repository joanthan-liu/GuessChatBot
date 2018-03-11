//
//  Created by Joanthan Liu
//  Copyright © 2013 Butterfly Tech. All rights reserved.
//

#import "JSQMessagesLabel.h"


@interface JSQMessagesLabel ()

- (void)jsq_configureLabel;

@end


@implementation JSQMessagesLabel

#pragma mark - Initialization

- (void)jsq_configureLabel
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.textInsets = UIEdgeInsetsZero;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self jsq_configureLabel];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self jsq_configureLabel];
}

#pragma mark - Setters

- (void)setTextInsets:(UIEdgeInsets)textInsets
{
    if (UIEdgeInsetsEqualToEdgeInsets(_textInsets, textInsets)) {
        return;
    }
    
    _textInsets = textInsets;
    [self setNeedsDisplay];
}

#pragma mark - Drawing

- (void)drawTextInRect:(CGRect)rect
{
    [super drawTextInRect:CGRectMake(CGRectGetMinX(rect) + self.textInsets.left,
                                     CGRectGetMinY(rect) + self.textInsets.top,
                                     CGRectGetWidth(rect) - self.textInsets.right,
                                     CGRectGetHeight(rect) - self.textInsets.bottom)];
}

@end
