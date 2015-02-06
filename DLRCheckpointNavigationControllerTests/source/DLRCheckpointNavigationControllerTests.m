//
//  DLRCheckpointNavigationControllerTests.m
//  DLRCheckpointNavigationController
//
//  Created by Nate Walczak on 12/23/14.
//  Copyright (c) 2014 Detroit Labs, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "DLRCheckpointNavigationController.h"

@interface DLRCheckpointNavigationControllerTests : XCTestCase

@end

@implementation DLRCheckpointNavigationControllerTests

#pragma mark - popToRootViewControllerAnimated:

- (void)testPopToRootViewControllerAnimated_with_checkpoint {
    UIViewController *viewController1 = [[UIViewController alloc] init];
    UIViewController *viewController2 = [[UIViewController alloc] init];
    UIViewController *viewController3 = [[UIViewController alloc] init];
    UIViewController *viewController4 = [[UIViewController alloc] init];
    
    DLRCheckpointNavigationController *navigationController = [[DLRCheckpointNavigationController alloc] init];
    [navigationController setViewControllers:@[viewController1, viewController2, viewController3, viewController4]];
    navigationController.checkpointViewController = viewController2;
    
    XCTAssertEqual(navigationController.viewControllers.count, 4);
    XCTAssertEqual(navigationController.topViewController, viewController4);
    XCTAssertEqual(navigationController.checkpointViewController, viewController2);
    
    [navigationController popToRootViewControllerAnimated:NO];
    
    XCTAssertEqual(navigationController.viewControllers.count, 2);
    XCTAssertEqual(navigationController.topViewController, viewController2);
    XCTAssertEqual(navigationController.checkpointViewController, viewController2);
    
    [navigationController popToRootViewControllerAnimated:NO];
    
    XCTAssertEqual(navigationController.viewControllers.count, 1);
    XCTAssertEqual(navigationController.topViewController, viewController1);
    XCTAssertNil(navigationController.checkpointViewController);
}

- (void)testPopToRootViewControllerAnimated_with_checkpoint_pop_pop {
    UIViewController *viewController1 = [[UIViewController alloc] init];
    UIViewController *viewController2 = [[UIViewController alloc] init];
    UIViewController *viewController3 = [[UIViewController alloc] init];
    UIViewController *viewController4 = [[UIViewController alloc] init];
    
    DLRCheckpointNavigationController *navigationController = [[DLRCheckpointNavigationController alloc] init];
    [navigationController setViewControllers:@[viewController1, viewController2, viewController3, viewController4]];
    navigationController.checkpointViewController = viewController3;
    
    XCTAssertEqual(navigationController.viewControllers.count, 4);
    XCTAssertEqual(navigationController.topViewController, viewController4);
    XCTAssertEqual(navigationController.checkpointViewController, viewController3);
    
    [navigationController popViewControllerAnimated:NO];
    
    XCTAssertEqual(navigationController.viewControllers.count, 3);
    XCTAssertEqual(navigationController.topViewController, viewController3);
    XCTAssertEqual(navigationController.checkpointViewController, viewController3);
    
    [navigationController popViewControllerAnimated:NO];
    
    XCTAssertEqual(navigationController.viewControllers.count, 2);
    XCTAssertEqual(navigationController.topViewController, viewController2);
    XCTAssertNil(navigationController.checkpointViewController);
    
    [navigationController popViewControllerAnimated:NO];
    
    XCTAssertEqual(navigationController.viewControllers.count, 1);
    XCTAssertEqual(navigationController.topViewController, viewController1);
    XCTAssertNil(navigationController.checkpointViewController);
}

- (void)testPopToRootViewControllerAnimated_with_no_checkpoint {
    UIViewController *viewController1 = [[UIViewController alloc] init];
    UIViewController *viewController2 = [[UIViewController alloc] init];
    UIViewController *viewController3 = [[UIViewController alloc] init];
    UIViewController *viewController4 = [[UIViewController alloc] init];
    
    DLRCheckpointNavigationController *navigationController = [[DLRCheckpointNavigationController alloc] init];
    [navigationController setViewControllers:@[viewController1, viewController2, viewController3, viewController4]];
    
    XCTAssertEqual(navigationController.viewControllers.count, 4);
    XCTAssertEqual(navigationController.topViewController, viewController4);
    XCTAssertNil(navigationController.checkpointViewController);
    
    [navigationController popToRootViewControllerAnimated:NO];
    
    XCTAssertEqual(navigationController.viewControllers.count, 1);
    XCTAssertEqual(navigationController.topViewController, viewController1);
    XCTAssertNil(navigationController.checkpointViewController);
}

@end
