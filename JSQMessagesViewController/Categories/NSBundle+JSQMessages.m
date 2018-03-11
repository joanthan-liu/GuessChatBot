//
//  Created by Joanthan Liu
//  Copyright © 2013 Butterfly Tech. All rights reserved.
//

#import "NSBundle+JSQMessages.h"

#import "JSQMessagesViewController.h"

@implementation NSBundle (JSQMessages)

+ (NSBundle *)jsq_messagesBundle
{
    return [NSBundle bundleForClass:[JSQMessagesViewController class]];
}

+ (NSBundle *)jsq_messagesAssetBundle
{
    NSString *bundleResourcePath = [NSBundle jsq_messagesBundle].resourcePath;
    NSString *assetPath = [bundleResourcePath stringByAppendingPathComponent:@"JSQMessagesAssets.bundle"];
    return [NSBundle bundleWithPath:assetPath];
}

+ (NSString *)jsq_localizedStringForKey:(NSString *)key
{
    return NSLocalizedStringFromTableInBundle(key, @"JSQMessages", [NSBundle jsq_messagesAssetBundle], nil);
}

@end
