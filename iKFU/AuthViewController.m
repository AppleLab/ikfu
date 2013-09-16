//
//  AuthViewController.m
//  iKFU
//
//  Created by User on 16.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "AuthViewController.h"
#import "Core.h"
#import "DataBaseHandler.h"

@interface AuthViewController ()

@end

@implementation AuthViewController

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

- (IBAction)login:(id)sender {
    NSString *email = self.email.text;
    NSString *pass = self.password.text;
    DataBaseHandler *dbh = [DataBaseHandler getSharedInstance];
    if ([dbh checkAuth:email withpassword:pass]){
        [Core core].loggedin = true;
        [self dismissViewControllerAnimated:false completion:nil];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Alert Title here"
                                                       message: @"Alert Message here"
                                                      delegate: self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"OK",nil];
        
        
        [alert show];
    }
}

- (IBAction)signup:(id)sender {
}
@end
