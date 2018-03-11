//
//  Created by Joanthan Liu
//  Copyright © 2013 Butterfly Tech. All rights reserved.
//

#import "AppDelegate.h"

#import "NSUserDefaults+DemoSettings.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Load our default settings
    [NSUserDefaults saveIncomingAvatarSetting:YES];
    [NSUserDefaults saveOutgoingAvatarSetting:YES];
    
    return YES;
}

@end
