//
//  AuthViewController.h
//  iKFU
//
//  Created by User on 16.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface AuthViewController : UIViewController
- (IBAction)login:(id)sender;
- (IBAction)signup:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end
