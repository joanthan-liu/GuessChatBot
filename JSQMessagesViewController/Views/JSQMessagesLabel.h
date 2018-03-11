//
//  Created by Joanthan Liu
//  Copyright © 2013 Butterfly Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  `JSQMessagesLabel` is a subclass of `UILabel` that adds support for a `textInsets` property,
 *  which is similar to the `textContainerInset` property of `UITextView`.
 */
@interface JSQMessagesLabel : UILabel

/**
 *  The inset of the text layout area within the label's content area. The default value is `UIEdgeInsetsZero`.
 *
 *  @discussion This property provides text margins for the text laid out in the label.
 *  The inset values provided must be greater than or equal to `0.0f`.
 */
@property (assign, nonatomic) UIEdgeInsets textInsets;

@end
