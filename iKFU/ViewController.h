//
//  ViewController.h
//  iKFU
//
//  Created by Ramil Garaev on 12.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


{
    NSString *eventTitle;
    NSArray *events;
}

@property(nonatomic, retain) NSString *eventTitle;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
