//
//  ViewController.m
//  SafariViewController
//
//  Created by Oisin Prendiville on 12/12/2015.
//  Copyright © 2015 Oisin Prendiville. All rights reserved.
//

#import "ViewController.h"
@import SafariServices;

@interface ViewController () <SFSafariViewControllerDelegate>

@end

@implementation ViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    // If we return default, and safari VC is in regular state (ie with default status bar too) we have no issues
    // return UIStatusBarStyleDefault;
    
    // If we return light and then swipe back from safari VC instead of tapping done we can get in trouble
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTap:(id)sender {
    SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"http://supertop.co"]];
    safariViewController.delegate = self;
    
    if (self.presentedViewController) {
        NSLog(@"We still have %@ as presented VC and will not be able to present %@",self.presentedViewController,safariViewController);
        [self dismissViewControllerAnimated:NO completion:^{
            NSLog(@"also this dismiss doesn't complete");
        }];
    }
    
    [self presentViewController:safariViewController animated:YES completion:^{
        NSLog(@"presented");
    }];
    
}

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    NSLog(@"Done with %@",controller);
}

- (void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully {
    NSLog(@"%@ loaded %d",controller,didLoadSuccessfully);
}




@end
