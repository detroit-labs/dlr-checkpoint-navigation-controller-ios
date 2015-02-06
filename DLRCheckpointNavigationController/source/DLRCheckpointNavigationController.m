//
//  DLRCheckpointNavigationController.m
//  DLRCheckpointNavigationController
//
//  Created by Nate Walczak on 10/16/14.
//  Copyright (c) 2014 Detroit Labs, LLC. All rights reserved.
//

#import "DLRCheckpointNavigationController.h"

@implementation DLRCheckpointNavigationController

- (UIViewController *)checkpointViewController {
    if (_checkpointViewController) {
        if (![self.viewControllers containsObject:_checkpointViewController]) {
            _checkpointViewController = nil;
        }
    }
    return _checkpointViewController;
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated {
    if (self.checkpointViewController) {
        if (![self.viewControllers containsObject:self.checkpointViewController]) {
            self.checkpointViewController = nil;
        }
    }
    
    if (!self.checkpointViewController) {
        return [super popToRootViewControllerAnimated:animated];
    }
    
    if (self.topViewController == self.checkpointViewController) {
        self.checkpointViewController = nil;
        return [super popToRootViewControllerAnimated:animated];
    }
    
    return [self popToViewController:self.checkpointViewController animated:animated];
}

@end
