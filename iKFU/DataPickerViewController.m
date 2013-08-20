//
//  DataPickerViewController.m
//  iKFU
//
//  Created by user on 20.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "DataPickerViewController.h"
#import "Core.h"
#import "AnEvent.h"

@interface DataPickerViewController ()

@end


@implementation DataPickerViewController
@synthesize datePicker1;
@synthesize datePicker2;


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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [AnEvent event].date = self.datePicker1.date;
    [AnEvent event].time = self.datePicker2.date;
}

@end
