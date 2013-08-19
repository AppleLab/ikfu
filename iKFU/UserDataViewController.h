//
//  UserDataViewController.h
//  iKFU
//
//  Created by user on 19.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDataViewController : UIViewController
- (IBAction)button:(id)sender;
@property (nonatomic, retain) IBOutlet UITextField *emailTextField, *password1TextField, *password2TextField;

@end
