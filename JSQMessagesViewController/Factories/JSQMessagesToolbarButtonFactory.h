//
//  Created by Joanthan Liu
//  Copyright © 2013 Butterfly Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  `JSQMessagesToolbarButtonFactory` is a factory that provides a means for creating the default
 *  toolbar button items to be displayed in the content view of a `JSQMessagesInputToolbar`.
 */
@interface JSQMessagesToolbarButtonFactory : NSObject

/**
 *  Creates and returns a new button that is styled as the default accessory button. 
 *  The button has a paper clip icon image and no text.
 *
 *  @return A newly created button.
 */
+ (UIButton *)defaultAccessoryButtonItem;

/**
 *  Creates and returns a new button that is styled as the default send button. 
 *  The button has title text `@"Send"` and no image.
 *
 *  @return A newly created button.
 */
+ (UIButton *)defaultSendButtonItem;

@end
