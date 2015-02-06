//
//  DLRCheckpointNavigationController.h
//  DLRCheckpointNavigationController
//
//  Created by Nate Walczak on 10/16/14.
//  Copyright (c) 2014 Detroit Labs, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLRCheckpointNavigationController : UINavigationController

@property (nonatomic) UIViewController *checkpointViewController;

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated;

@end
