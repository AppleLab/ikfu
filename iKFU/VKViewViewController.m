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
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"vkWidget" ofType:@"html"];
    NSString* html = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
   [_vkWigdet loadHTMLString:html baseURL:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL) webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType {
    if ( inType == UIWebViewNavigationTypeLinkClicked ) {
        [[UIApplication sharedApplication]
         openURL:[inRequest URL]];
        return NO;
    } return YES;
}
@end
