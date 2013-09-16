//
//  DataBaseHandler.h
//  iKFU
//
//  Created by User on 16.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBaseHandler : NSObject{
    NSString *databasePath;
}
+(DataBaseHandler*)getSharedInstance;
-(BOOL)createDB;
-(BOOL) checkAuth:(NSString*)email withpassword:(NSString*)password;
-(BOOL) checkEmail:(NSString*)email;
-(void) addUser:(NSString*)email withpassword:(NSString*)password;
@end
