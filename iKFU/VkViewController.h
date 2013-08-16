//
//  VkViewController.h
//  iKFU
//
//  Created by user on 15.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VkViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *web;
@property NSString *username, *realName, *ID, *link, *email, *access_token;

+ (id)sharedInstance;
-(void) loginWithParams: (NSMutableDictionary*) params;
@end
