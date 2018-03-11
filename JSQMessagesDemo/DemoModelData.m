//
//  Created by Joanthan Liu
//  Copyright © 2013 Butterfly Tech. All rights reserved.
//

#import "DemoModelData.h"

#import "NSUserDefaults+DemoSettings.h"
#import "distance.h"
#import <AVFoundation/AVFoundation.h>

/**
 *  This is for demo/testing purposes only.
 *  This object sets up some fake model data.
 *  Do not actually do anything like this.
 */
@interface DemoModelData()
@property (nonatomic, strong) NSMutableSet *words;
@property (nonatomic, strong) W2VDistance *distanceModel;
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@end

@implementation DemoModelData

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.words = [NSMutableSet set];
        if ([NSUserDefaults emptyMessagesSetting]) {
            self.messages = [NSMutableArray new];
        }
        else {
            [self loadFakeMessages];
        }
        
        _distanceModel = [W2VDistance new];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            NSError *error = nil;
            NSURL *url = [[NSBundle mainBundle] URLForResource:@"out" withExtension:@"bin"];
            [_distanceModel loadBinaryVectorFile:url error:&error];
        });
        self.synthesizer = [AVSpeechSynthesizer new];


        /**
         *  Create avatar images once.
         *
         *  Be sure to create your avatars one time and reuse them for good performance.
         *
         *  If you are not using avatars, ignore this.
         */
        JSQMessagesAvatarImage *jsqImage = [JSQMessagesAvatarImageFactory avatarImageWithUserInitials:@"Me"
                                                                                      backgroundColor:[UIColor colorWithWhite:0.85f alpha:1.0f]
                                                                                            textColor:[UIColor colorWithWhite:0.60f alpha:1.0f]
                                                                                                 font:[UIFont systemFontOfSize:14.0f]
                                                                                             diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        
        JSQMessagesAvatarImage *cookImage = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"demo_avatar_cook"]
                                                                                       diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        
        JSQMessagesAvatarImage *jobsImage = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"demo_avatar_jobs"]
                                                                                       diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        
        JSQMessagesAvatarImage *wozImage = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"demo_avatar_woz"]
                                                                                      diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        JSQMessagesAvatarImage *image700 = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"700"]
                                                                                      diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        
        self.avatars = @{ kJSQDemoAvatarIdSquires : jsqImage,
                          kJSQDemoAvatarIdCook : cookImage,
                          kJSQDemoAvatarIdJobs : jobsImage,
                          kJSQDemoAvatarIdWoz : wozImage,
                          kJSQDemoAvatarId700 : image700};
        
        
        self.users = @{ kJSQDemoAvatarIdJobs : kJSQDemoAvatarDisplayNameJobs,
                        kJSQDemoAvatarIdCook : kJSQDemoAvatarDisplayNameCook,
                        kJSQDemoAvatarIdWoz : kJSQDemoAvatarDisplayNameWoz,
                        kJSQDemoAvatarIdSquires : kJSQDemoAvatarDisplayNameSquires,
                        kJSQDemoAvatarId700: kJSQDemoAvatarDisplayName700};
        
        
        /**
         *  Create message bubble images objects.
         *
         *  Be sure to create your bubble images one time and reuse them for good performance.
         *
         */
        JSQMessagesBubbleImageFactory *bubbleFactory = [[JSQMessagesBubbleImageFactory alloc] init];
        
        self.outgoingBubbleImageData = [bubbleFactory outgoingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleLightGrayColor]];
        self.incomingBubbleImageData = [bubbleFactory incomingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleGreenColor]];
    }
    
    return self;
}

- (void)loadFakeMessages
{
    /**
     *  Load some fake messages for demo.
     *
     *  You should have a mutable array or orderedSet, or something.
     */
    self.messages = [[NSMutableArray alloc] initWithObjects:
                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarId700
                                        senderDisplayName:kJSQDemoAvatarDisplayName700
                                                     date:[NSDate date]
                                                     text:@"Hello, I'm a Chat Bot to guess what you type. Let's play!"],
                     
                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarId700
                                        senderDisplayName:kJSQDemoAvatarDisplayName700
                                                     date:[NSDate distantPast]
                                                     text:@"You can type an English word and I can find a relative one for it. You are allowed to give me three words associcated in some ways and I can guess the fourth one."],
                     nil];


//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdSquires
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameSquires
//                                                     date:[NSDate distantPast]
//                                                     text:@"It even has data detectors. You can call me tonight. My cell number is 123-456-7890. My website is www.hexedbits.com."],
//                     
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdJobs
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameJobs
//                                                     date:[NSDate date]
//                                                     text:@"JSQMessagesViewController is nearly an exact replica of the iOS Messages App. And perhaps, better."],
//                     
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdCook
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameCook
//                                                     date:[NSDate date]
//                                                     text:@"It is unit-tested, free, open-source, and documented."],
//                     
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdSquires
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameSquires
//                                                     date:[NSDate date]
//                                                     text:@"Now with media messages!"],
//                     nil];
    
//    [self addPhotoMediaMessage];
    
    /**
     *  Setting to load extra messages for testing/demo
     */
    if ([NSUserDefaults extraMessagesSetting]) {
        NSArray *copyOfMessages = [self.messages copy];
        for (NSUInteger i = 0; i < 4; i++) {
            [self.messages addObjectsFromArray:copyOfMessages];
        }
    }
    
    
    /**
     *  Setting to load REALLY long message for testing/demo
     *  You should see "END" twice
     */
    if ([NSUserDefaults longMessageSetting]) {
        JSQMessage *reallyLongMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdSquires
                                                            displayName:kJSQDemoAvatarDisplayNameSquires
                                                                   text:@"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? END Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? END"];
        
        [self.messages addObject:reallyLongMessage];
    }
}

- (void)addPhotoMediaMessage
{
    JSQPhotoMediaItem *photoItem = [[JSQPhotoMediaItem alloc] initWithImage:[UIImage imageNamed:@"goldengate"]];
    JSQMessage *photoMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdSquires
                                                   displayName:kJSQDemoAvatarDisplayNameSquires
                                                         media:photoItem];
    [self.messages addObject:photoMessage];
}

- (void)addLocationMediaMessageCompletion:(JSQLocationMediaItemCompletionBlock)completion
{
    CLLocation *ferryBuildingInSF = [[CLLocation alloc] initWithLatitude:37.795313 longitude:-122.393757];
    
    JSQLocationMediaItem *locationItem = [[JSQLocationMediaItem alloc] init];
    [locationItem setLocation:ferryBuildingInSF withCompletionHandler:completion];
    
    JSQMessage *locationMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdSquires
                                                      displayName:kJSQDemoAvatarDisplayNameSquires
                                                            media:locationItem];
    [self.messages addObject:locationMessage];
}

- (void)addVideoMediaMessage
{
    // don't have a real video, just pretending
    NSURL *videoURL = [NSURL URLWithString:@"file://"];
    
    JSQVideoMediaItem *videoItem = [[JSQVideoMediaItem alloc] initWithFileURL:videoURL isReadyToPlay:YES];
    JSQMessage *videoMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdSquires
                                                   displayName:kJSQDemoAvatarDisplayNameSquires
                                                         media:videoItem];
    [self.messages addObject:videoMessage];
}

- (void)associationForWord:(NSString *) word {
    
    NSMutableDictionary *dict = nil;
    NSInteger wordCount = [[word componentsSeparatedByString:@" "] count];
    
    if (wordCount == 3 || wordCount == 2) {
        dict = [[self.distanceModel analogyToPhrase:word.lowercaseString numberOfClosest:@20] mutableCopy];
    } else {
        dict = [[self.distanceModel closestToWord:word.lowercaseString numberOfClosest:@20] mutableCopy];
    }
    
    NSString *res = nil;
    for (NSInteger i = 0; i<dict.count; i++) {
        NSNumber * max = [dict.allValues valueForKeyPath:@"@max.floatValue"];
        NSArray *keys = [[dict keysOfEntriesPassingTest:^BOOL(NSString *  _Nonnull key,
                                                             NSNumber *  _Nonnull obj,
                                                             BOOL * _Nonnull stop) {
            return [max isEqualToNumber:obj];
        }] allObjects];
        
        NSString *key = keys.firstObject;
        
        if ([self.words containsObject:key]) {
            [dict removeObjectForKey:key];
        } else {
            
            NSArray *tags1 = [word linguisticTagsInRange:NSMakeRange(0, [word length])
                                        scheme:NSLinguisticTagSchemeLemma
                                       options:NSLinguisticTaggerOmitPunctuation|NSLinguisticTaggerOmitWhitespace
                                   orthography:nil
                                   tokenRanges:nil];
            
            NSArray *tags2 = [key linguisticTagsInRange:NSMakeRange(0, [key length])
                                                        scheme:NSLinguisticTagSchemeLemma
                                                       options:NSLinguisticTaggerOmitPunctuation|NSLinguisticTaggerOmitWhitespace
                                                   orthography:nil
                                                   tokenRanges:nil];
            
            NSString *inputWordLemma = [tags1 firstObject];
            NSString *closestWordLemma = [tags2 firstObject];
            
            if ([inputWordLemma isEqualToString:closestWordLemma]
                && [inputWordLemma length] > 0) {
                [dict removeObjectForKey:key];

            } else {
                res = key;
                break;
            }
        }
    }
    
    if (res != nil && ![res isEqualToString:@""]) {
        [self.words addObject:res];
    } else {
        res = @"...";
    }

        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:res];
        utterance.voice = [AVSpeechSynthesisVoice voiceWithIdentifier:@"en-US"];
    
//    utterance.volume = 1;
//    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
//    utterance.voice = voice;
    
        [self.synthesizer speakUtterance:utterance];
        
    
    JSQMessage *message = [JSQMessage messageWithSenderId:kJSQDemoAvatarId700
                                              displayName:kJSQDemoAvatarDisplayName700
                                                     text:[res capitalizedString]];
    
    [self.messages addObject:message];
}

@end
