//
//  VKViewViewController.m
//  iKFU
//
//  Created by user on 13.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "VKViewViewController.h"

@interface VKViewViewController ()

@end

@implementation VKViewViewController

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
	// Do any additional setup after loading the view.
    NSString *fullURL = @"/Users/user/Documents/ikfu/ikfu/iKFU/vkWidget.html";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_vkWigdet loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
