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
    if(![self validateEmail:email]) {
        // user entered invalid email address
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ошибка" message:@"Введите корректный email." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    } else {
        // user entered valid email address
        NSString *pass = self.pass.text;
        DataBaseHandler *dbh = [DataBaseHandler getSharedInstance];
        if ([dbh checkEmail:email]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Ошибка"
                                                           message: @"Данный email уже зарегистрирован."
                                                          delegate: self
                                                 cancelButtonTitle: nil
                                                 otherButtonTitles:@"OK",nil];
            [alert show];
        }
        else{
            if (![self validatePassword:pass]){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ошибка" message:@"Пароль должен иметь длину не менее 8 символов." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alert show];
            }
            else{
                [dbh addUser:email withpassword:pass];
                [Core core].loggedin = true;
                [Core core].email = email;
                [self performSegueWithIdentifier:@"contSegue" sender:self];
            }
        }
        
    }
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (BOOL)validateEmail:(NSString *)emailStr {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}
- (BOOL)validatePassword:(NSString *)password {
    return [password length] >= 8;
}
@end
