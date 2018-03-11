//
//  Created by Joanthan Liu
//  Copyright © 2013 Butterfly Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JSQMessagesBubbleSizeCalculating.h"

/**
 *  An instance of `JSQMessagesBubblesSizeCalculator` is responsible for calculating
 *  message bubble sizes for an instance of `JSQMessagesCollectionViewFlowLayout`.
 */
@interface JSQMessagesBubblesSizeCalculator : NSObject <JSQMessagesBubbleSizeCalculating>

/**
 *  Initializes and returns a bubble size calculator with the given cache and minimumBubbleWidth.
 *
 *  @param cache                 A cache object used to store layout information.
 *  @param minimumBubbleWidth    The minimum width for any given message bubble.
 *  @param usesFixedWidthBubbles Specifies whether or not to use fixed-width bubbles.
 *  If `NO` (the default), then bubbles will resize when rotating to landscape.
 *
 *  @return An initialized `JSQMessagesBubblesSizeCalculator` object if successful, `nil` otherwise.
 */
- (instancetype)initWithCache:(NSCache *)cache
           minimumBubbleWidth:(NSUInteger)minimumBubbleWidth
        usesFixedWidthBubbles:(BOOL)usesFixedWidthBubbles NS_DESIGNATED_INITIALIZER;

@end
