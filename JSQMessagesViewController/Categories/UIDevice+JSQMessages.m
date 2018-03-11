//
//  Created by Joanthan Liu
//  Copyright © 2013 Butterfly Tech. All rights reserved.
//

#import "UIDevice+JSQMessages.h"

@implementation UIDevice (JSQMessages)

+ (BOOL)jsq_isCurrentDeviceBeforeiOS8
{
    // iOS < 8.0
    return [[UIDevice currentDevice].systemVersion compare:@"8.0" options:NSNumericSearch] == NSOrderedAscending;
}

@end
