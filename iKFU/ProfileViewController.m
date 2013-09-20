//
//  ProfileViewController.m
//  iKFU
//
//  Created by User on 16.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "ProfileViewController.h"
#import "Core.h"
#import "DataBaseHandler.h"

@interface ProfileViewController ()

@end

NSMutableArray *content;
@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    if (![Core core].loggedin){
        [self performSegueWithIdentifier: @"authSegue1" sender: self];
    }
    else{
        DataBaseHandler *dbh = [DataBaseHandler getSharedInstance];
        content = [dbh getProfileInfo:[Core core].email];
        self.email.text = [content objectAtIndex:0];
        self.name.text = [content objectAtIndex:1];
        self.faculty.text = [content objectAtIndex:2];
    }
    [super viewWillAppear:NO];
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

- (IBAction)logoff:(id)sender {
    [Core core].loggedin = NO;
    [self performSegueWithIdentifier: @"authSegue1" sender: self];
}
@end
