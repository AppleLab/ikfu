//
//  UserInfo.h
//  iKFU
//
//  Created by user on 19.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <Foundation/Foundation.h> 

@interface UserInfo : NSObject {
    NSString *email;
    NSString *password;
}

@property (nonatomic, retain) NSString *email, *password;

@end
