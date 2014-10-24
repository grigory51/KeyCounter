//
//  KeyHandler.h
//  key-counter
//
//  Created by Grigory Ozhegov on 24/10/14.
//  Copyright (c) 2014 KTS Studio ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/NSEvent.h>

@interface KeyHandler : NSObject {
    NSMutableString *logLine;
    NSString *lastApp;
    NSUInteger previousFlags;
}

@property (nonatomic, retain) NSMutableString *logLine;
@property (nonatomic, retain) NSString *lastApp;

- (void)logModifierKeys:(NSUInteger)modifierFlags;
- (void)handleKeyPress:(NSEvent*)event;
- (void)writeLine;
- (void)appDidActivate:(NSNotification *)notification;
- (NSString*)getAppName:(NSString*)appInfo;
- (NSString*)keyCodeConversion:(unsigned short)keyCode;

@end
