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
        [Core core].email = email;
        [Core core].password = pass;
        NSMutableArray *info = [dbh getProfileInfo:email];
        [Core core].faculty = [info objectAtIndex:2];
        [Core core].id = [[info objectAtIndex:3] integerValue];
        [self dismissViewControllerAnimated:false completion:nil];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Ошибка"
                                                       message: @"Данный email не зарегистрирован, или пароль не верен."
                                                      delegate: self
                                             cancelButtonTitle: nil
                                             otherButtonTitles:@"OK",nil];
        
        
        [alert show];
    }
}

- (IBAction)signup:(id)sender {
    [self performSegueWithIdentifier: @"signupsegue" sender: self];
}
@end
