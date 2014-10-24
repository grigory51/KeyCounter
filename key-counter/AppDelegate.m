//
//  AppDelegate.m
//  key-counter
//
//  Created by Grigory Ozhegov on 24/10/14.
//  Copyright (c) 2014 KTS Studio ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "KeyHandler.h"
@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSLog(@"Set handler");
    keyHandler = [[KeyHandler alloc] init];
    
    
    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:keyHandler
                                                        selector:@selector(appDidActivate:)
                                                        name: NSWorkspaceDidActivateApplicationNotification
                                                        object:nil];
    
    NSLog(@"Set handler");
    //Notifications for key presses
    //[NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyDownMask
    //                                     handler:^ (NSEvent *event) {[keylogger handleKeyPress:event];}];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
