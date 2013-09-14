//
//  ViewTreeViewController.m
//  WeViews2DemoApp
//
//  Copyright (c) 2013 Charles Matthew Chen. All rights reserved.
//
//  Distributed under the Apache License v2.0.
//  http://www.apache.org/licenses/LICENSE-2.0.html
//

#import "UIView+WeView.h"
#import "ViewTreeViewController.h"
#import "ViewHierarchyTree.h"
#import "WeViewDemoConstants.h"

@interface ViewTreeViewController ()

@property (nonatomic) WeView *rootView;

@property (nonatomic) ViewHierarchyTree *viewHierarchyTree;

@end

#pragma mark -

@implementation ViewTreeViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.title = NSLocalizedString(@"View Hierarchy", nil);

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleDemoChanged:)
                                                     name:NOTIFICATION_DEMO_CHANGED
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)handleDemoChanged:(NSNotification *)notification
{
    [self updateDemoModel:notification.object];
}

- (void)loadView
{
    self.rootView = [[WeView alloc] init];
    [[self.rootView useVerticalDefaultLayout] setVAlign:V_ALIGN_TOP];
    //    self.rootView.debugLayout = YES;
    self.rootView.opaque = YES;
    self.rootView.backgroundColor = [UIColor whiteColor];
    self.view = self.rootView;

    [self updateDemoModel:[DemoModel create]];
}

- (void)updateDemoModel:(DemoModel *)demoModel
{
    [self.rootView removeAllSubviews];
    self.viewHierarchyTree = [ViewHierarchyTree create:demoModel];
    [self.viewHierarchyTree setStretchesIgnoringDesiredSize];
    [self.rootView addSubview:self.viewHierarchyTree];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
