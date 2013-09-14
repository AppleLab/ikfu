//
//  DetailEvent.m
//  iKFU
//
//  Created by user on 14.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "DetailEvent.h"

@interface DetailEvent ()

@end

@implementation DetailEvent

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
    [_scrollview setContentSize:CGSizeMake(220.0, 800.0)];
    [_scrollview setClipsToBounds:YES];
    [self.label sizeToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
