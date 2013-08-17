//
//  DescribeEvents.h
//  iKFU
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DescribeEvents : UIViewController
{
    NSArray* array;
    int indexOfMouth;
    NSArray *events;
}
- (IBAction)ActionNext:(id)sender;
- (IBAction)ActionPrev:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tv;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (nonatomic, retain) NSArray *events;

@end
