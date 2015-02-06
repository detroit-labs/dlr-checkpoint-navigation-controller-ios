//
//  ViewController.m
//  DLRCheckpointNavigationController
//
//  Created by Nate Walczak on 2/10/15.
//  Copyright (c) 2015 Detroit Labs, LLC. All rights reserved.
//

#import "ViewController.h"

#import "DLRCheckpointNavigationController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *popToRootButton;
@property (weak, nonatomic) IBOutlet UIButton *popButton;

@property (weak, nonatomic) IBOutlet UIButton *checkpointButtonButton;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    if ([self isMovingToParentViewController]) {
        [self updateTitle];
        [self showPopButtons];
    }
    [self showPushButtons];
}

- (void)updateTitle {
    NSUInteger index = 1 + [self.navigationController.viewControllers indexOfObject:self];
    
    NSString *title = [NSString stringWithFormat:@"Stack Level: %ld", (long)index];
    self.title = title;
}

- (void)showPopButtons {
    self.popToRootButton.hidden = NO;
    self.popButton.hidden = NO;
}

- (void)showPushButtons {
    if (1 < self.navigationController.viewControllers.count) {
        if ([self.navigationController isKindOfClass:[DLRCheckpointNavigationController class]]) {
            DLRCheckpointNavigationController *checkpointNavigationController = (id)self.navigationController;
            if (!checkpointNavigationController.checkpointViewController) {
                self.checkpointButtonButton.hidden = NO;
            }
        }
    }
}

- (IBAction)didTapPopButton:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)didTapPopToRootButton:(UIButton *)button {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
