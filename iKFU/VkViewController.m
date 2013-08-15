//
//  VkViewController.m
//  iKFU
//
//  Created by user on 15.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "VkViewController.h"

@interface VkViewController ()

@end

@implementation VkViewController
@synthesize web;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//
- (void)viewDidLoad
{
    [super viewDidLoad];
	[web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://oauth.vk.com/authorize?client_id=3822741&redirect_uri=http://oauth.vk.com/blank.html&display=touch&response_type=token&scope=offline"]]];
//    [web setScalesPageToFit:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
