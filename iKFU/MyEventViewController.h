//
//  MyEventViewController.h
//  iKFU
//
//  Created by User on 16.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyEventViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tv;
- (IBAction)check:(id)sender;

@end
