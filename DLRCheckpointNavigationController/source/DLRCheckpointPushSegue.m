//
//  DLRCheckpointPushSegue.m
//  DLRCheckpointNavigationController
//
//  Created by Nate Walczak on 10/16/14.
//  Copyright (c) 2014 Detroit Labs, LLC. All rights reserved.
//

#import "DLRCheckpointPushSegue.h"

#import "DLRCheckpointNavigationController.h"

@implementation DLRCheckpointPushSegue

- (void)perform {
    [self performAnimated:YES];
}

- (void)performAnimated:(BOOL)animated {
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    
    UINavigationController *navigationController = sourceViewController.navigationController;

    if ([navigationController isKindOfClass:[DLRCheckpointNavigationController class]]) {
        DLRCheckpointNavigationController *checkpointNavigationController = (id)navigationController;
        checkpointNavigationController.checkpointViewController = destinationViewController;
    }
    
    [navigationController pushViewController:destinationViewController animated:animated];
}

@end
