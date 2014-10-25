//
//  AppDelegate.m
//  key-counter
//
//  Created by Grigory Ozhegov on 24/10/14.
//  Copyright (c) 2014 KTS Studio ltd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)initKeyHandler {
    _keyHandler = [[KeyHandler alloc] init];

    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:_keyHandler
                                                           selector:@selector(appDidActivate:)
                                                               name:NSWorkspaceDidActivateApplicationNotification
                                                             object:nil];

    [NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyDownMask
                                           handler:^(NSEvent* event) {
                                               [_keyHandler handleKeyPress:event];
                                           }];
}

- (void)dealloc {
    [[[NSWorkspace sharedWorkspace] notificationCenter] removeObserver:_keyHandler];
}

- (void)exitAction:(id)senderId {
    exit(0);
}

- (void)awakeFromNib {
    if (AXIsProcessTrustedWithOptions != NULL) {
        // 10.9 and later
        const void* keys[] = {kAXTrustedCheckOptionPrompt};
        const void* values[] = {kCFBooleanTrue};

        CFDictionaryRef options = CFDictionaryCreate(
                kCFAllocatorDefault,
                keys,
                values,
                sizeof(keys) / sizeof(*keys),
                &kCFCopyStringDictionaryKeyCallBacks,
                &kCFTypeDictionaryValueCallBacks);

        AXIsProcessTrustedWithOptions(options);
    }

    NSImage* menuIcon = [NSImage imageNamed:@"StatusIcon"];

    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [_statusItem setMenu:_menu];
    [_statusItem setImage:menuIcon];
    [_statusItem setHighlightMode:YES];

    [self initKeyHandler];
}

@end