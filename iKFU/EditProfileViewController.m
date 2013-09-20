//
//  EditProfileViewController.m
//  iKFU
//
//  Created by user on 20.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "EditProfileViewController.h"
#import "Core.h"
#import "DataBaseHandler.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

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

- (IBAction)edit:(id)sender {
    NSString *oldPass = self.oldPass.text;
    NSString *newPass = self.reallynewPass.text;
    if ([oldPass isEqualToString:[Core core].password]){
        NSString *faculty = self.faculty.text;
        DataBaseHandler *dbh = [DataBaseHandler getSharedInstance];
        [dbh editUserInfo:[Core core].email withPass:newPass withFaculty:faculty];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Ошибка"
                                                       message: @"Текущий пароль не верен."
                                                      delegate: self
                                             cancelButtonTitle: nil
                                             otherButtonTitles:@"OK",nil];
        [alert show];
    }
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
