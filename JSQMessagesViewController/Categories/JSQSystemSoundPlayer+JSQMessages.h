//
//  Created by Joanthan Liu
//  Copyright © 2013 Butterfly Tech. All rights reserved.
//

#import <JSQSystemSoundPlayer/JSQSystemSoundPlayer.h>

@interface JSQSystemSoundPlayer (JSQMessages)

/**
 *  Plays the default sound for received messages.
 */
+ (void)jsq_playMessageReceivedSound;

/**
 *  Plays the default sound for received messages *as an alert*, invoking device vibration if available.
 */
+ (void)jsq_playMessageReceivedAlert;

/**
 *  Plays the default sound for sent messages.
 */
+ (void)jsq_playMessageSentSound;

/**
 *  Plays the default sound for sent messages *as an alert*, invoking device vibration if available.
 */
+ (void)jsq_playMessageSentAlert;

@end
