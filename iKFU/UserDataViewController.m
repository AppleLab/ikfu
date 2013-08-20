//
//  UserDataViewController.m
//  iKFU
//
//  Created by user on 19.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "UserDataViewController.h"
#import "UserInfo.h"

#define DOCUMENTS [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]


@interface UserDataViewController ()

@end

@implementation UserDataViewController
@synthesize emailTextField, password1TextField, password2TextField;


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
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [emailTextField resignFirstResponder];
    [password1TextField resignFirstResponder];
    [password2TextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button:(id)sender {
    NSString *email = self.password1TextField.text;
    NSString *pas1 = self.password1TextField.text;
    NSString *pas2 = self.password2TextField.text;
    NSLog(@"%@", email);
    NSLog(@"%@", pas1);
    NSLog(@"%@", pas2);
    NSLog(@"Hi1");

    if([pas1 isEqualToString: pas2]){
        NSLog(@"Hi2");
        NSMutableArray *marray = [[NSMutableArray alloc] init];
        UserInfo *us = [[UserInfo alloc]init];
        us.email = email;
        us.password = pas1;
        [marray addObject:us];
         NSString *filePath = [DOCUMENTS stringByAppendingPathComponent:@"login.plist"];
        [marray writeToFile:filePath atomically:(YES)];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *yourViewController = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
        [self presentModalViewController:yourViewController animated:YES];
    }
}
@end
