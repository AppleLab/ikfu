//
//  ProfileViewController.h
//  iKFU
//
//  Created by user on 17.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UITableViewController

@property (nonatomic, retain) NSArray *userActions;
- (IBAction)Exit:(id)sender;

@end
