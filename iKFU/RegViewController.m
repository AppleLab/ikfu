//
//  RegViewController.m
//  iKFU
//
//  Created by user on 17.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "RegViewController.h"

@interface RegViewController ()

@end

@implementation RegViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	if([[NSUserDefaults standardUserDefaults]objectForKey:@"vk_token"] != nil){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *yourViewController = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
//        [self presentModalViewController:yourViewController animated:YES];
        [self presentViewController:yourViewController animated: YES completion: nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
