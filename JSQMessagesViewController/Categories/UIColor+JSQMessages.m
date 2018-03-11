//
//  Created by Joanthan Liu
//  Copyright © 2013 Butterfly Tech. All rights reserved.
//

#import "UIColor+JSQMessages.h"

@implementation UIColor (JSQMessages)

#pragma mark - Message bubble colors

+ (UIColor *)jsq_messageBubbleGreenColor
{
    return [UIColor colorWithHue:65.0f / 360.0f
                      saturation:0.68f
                      brightness:0.42f
                           alpha:1.0f];
}

+ (UIColor *)jsq_messageBubbleBlueColor
{
    return [UIColor colorWithHue:110.0f / 360.0f
                      saturation:0.94f
                      brightness:1.5f
                           alpha:1.0f];
}

+ (UIColor *)jsq_messageBubbleRedColor
{
    return [UIColor colorWithHue:0.0f / 360.0f
                      saturation:0.79f
                      brightness:1.0f
                           alpha:1.0f];
}

+ (UIColor *)jsq_messageBubbleLightGrayColor
{
    return [UIColor colorWithHue:120.0f / 360.0f
                      saturation:0.02f
                      brightness:0.50f
                           alpha:1.0f];
}

#pragma mark - Utilities

- (UIColor *)jsq_colorByDarkeningColorWithValue:(CGFloat)value
{
    NSUInteger totalComponents = CGColorGetNumberOfComponents(self.CGColor);
    BOOL isGreyscale = (totalComponents == 2) ? YES : NO;
    
    CGFloat *oldComponents = (CGFloat *)CGColorGetComponents(self.CGColor);
    CGFloat newComponents[4];
    
    if (isGreyscale) {
        newComponents[0] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[1] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[2] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[3] = oldComponents[1];
    }
    else {
        newComponents[0] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[1] = oldComponents[1] - value < 0.0f ? 0.0f : oldComponents[1] - value;
        newComponents[2] = oldComponents[2] - value < 0.0f ? 0.0f : oldComponents[2] - value;
        newComponents[3] = oldComponents[3];
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
    return retColor;
}

@end
