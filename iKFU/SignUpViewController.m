//
//  SignUpViewController.m
//  iKFU
//
//  Created by User on 16.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "SignUpViewController.h"
#import "DataBaseHandler.h"
#import "Core.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

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

- (IBAction)signup:(id)sender {
    NSString *email = self.email.text;
    NSString *pass = self.pass.text;
    DataBaseHandler *dbh = [DataBaseHandler getSharedInstance];
    if ([dbh checkEmail:email]){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Alert Title here"
                                                       message: @"Alert Message here"
                                                      delegate: self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"OK",nil];
        [alert show];
    }
    else{
        [dbh addUser:email withpassword:pass];
        [Core core].loggedin = true;
        [Core core].email = email;
        [self performSegueWithIdentifier:@"contSegue" sender:self];
    }
}
@end
