//
//  AppDelegate.h
//  key-counter
//
//  Created by Grigory Ozhegov on 24/10/14.
//  Copyright (c) 2014 KTS Studio ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "KeyHandler.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    KeyHandler* keyHandler;
}
@end

