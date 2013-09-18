//
//  ProfileViewController.h
//  iKFU
//
//  Created by User on 16.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
- (IBAction)logoff:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *faculty;

@end
