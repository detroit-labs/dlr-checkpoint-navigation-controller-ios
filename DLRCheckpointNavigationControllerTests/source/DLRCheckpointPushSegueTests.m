//
//  DLRCheckpointPushSegueTests.m
//  DLRCheckpointNavigationController
//
//  Created by Nate Walczak on 12/23/14.
//  Copyright (c) 2014 Detroit Labs, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "DLRCheckpointNavigationController.h"
#import "DLRCheckpointPushSegue.h"

@interface DLRCheckpointPushSegue (XCTestCase)

- (void)performAnimated:(BOOL)animated;
    
@end

@interface DLRCheckpointPushSegueTests : XCTestCase

@end

@implementation DLRCheckpointPushSegueTests

#pragma mark - performAnimated:

- (void)testPerformAnimated {
    UIViewController *viewController1 = [[UIViewController alloc] init];
    UIViewController *viewController2 = [[UIViewController alloc] init];
    UIViewController *viewController3 = [[UIViewController alloc] init];
    UIViewController *viewController4 = [[UIViewController alloc] init];
    
    DLRCheckpointNavigationController *navigationController = [[DLRCheckpointNavigationController alloc] init];
    [navigationController pushViewController:viewController1 animated:NO];
    
    XCTAssertEqual(navigationController.viewControllers.count, 1);
    XCTAssertNil(navigationController.checkpointViewController);
    
    DLRCheckpointPushSegue *segue = [[DLRCheckpointPushSegue alloc] initWithIdentifier:@"" source:viewController1 destination:viewController2];
    [segue performAnimated:NO];
    
    XCTAssertEqual(navigationController.viewControllers.count, 2);
    XCTAssertEqual(navigationController.checkpointViewController, viewController2);
    
    [navigationController pushViewController:viewController3 animated:NO];
    [navigationController pushViewController:viewController4 animated:NO];
    
    XCTAssertEqual(navigationController.viewControllers.count, 4);
    XCTAssertEqual(navigationController.topViewController, viewController4);
    
    [navigationController popToRootViewControllerAnimated:YES];
    
    XCTAssertEqual(navigationController.viewControllers.count, 2);
    XCTAssertEqual(navigationController.topViewController, viewController2);
    
    [navigationController popToRootViewControllerAnimated:YES];
    
    XCTAssertEqual(navigationController.viewControllers.count, 1);
    XCTAssertEqual(navigationController.topViewController, viewController1);
}

@end
