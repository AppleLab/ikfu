//
//  NameTitleDescribeViewController.m
//  iKFU
//
//  Created by user on 20.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "NameTitleDescribeViewController.h"
#import "AnEvent.h"

@interface NameTitleDescribeViewController ()

@end

@implementation NameTitleDescribeViewController
@synthesize nameTextBox;
@synthesize themeTextBox;
@synthesize describeTextBox;


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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [AnEvent event].Name = nameTextBox.text;
    [AnEvent event].Theme = themeTextBox.text;
    [AnEvent event].Describe = describeTextBox.text;
}

@end
