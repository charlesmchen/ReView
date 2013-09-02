//
//  WeView2StackLayout.h
//  Unknown Project
//
//  Copyright (c) 2013 Charles Matthew Chen. All rights reserved.
//

#pragma once

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "WeView2Layout.h"

@interface WeView2StackLayout : WeView2Layout

// Factory method.
//
// Lays out all views stacked on top of each other.
+ (WeView2StackLayout *)stackLayout;

@end