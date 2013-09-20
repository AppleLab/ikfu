//
//  EditProfileViewController.h
//  iKFU
//
//  Created by user on 20.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditProfileViewController : UIViewController
- (IBAction)edit:(id)sender;
- (IBAction)cancel:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *oldPass;
@property (weak, nonatomic) IBOutlet UITextField *reallynewPass;
@property (weak, nonatomic) IBOutlet UITextField *faculty;

@end
