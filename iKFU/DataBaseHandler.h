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
-(NSMutableArray *) eventDetails:(NSInteger)limit;
-(NSString *) eventTitle;
-(NSString *) eventDate;
-(BOOL) checkAuth:(NSString*)email withpassword:(NSString*)password;
-(BOOL) checkEmail:(NSString*)email;
-(void) addUser:(NSString*)email withpassword:(NSString*)password;
- (NSMutableArray *) getProfileInfo:(NSString *)email;
- (void) editUserInfo:(NSString *)email withPass:(NSString *)pass withFaculty:(NSString *)faculty;
- (NSMutableArray *) eventDetailsWithKnownParticipant:(NSInteger)limit withCreator:(NSInteger)part;
- (NSMutableArray *) eventDetailsWithKnownCreator:(NSInteger)limit withCreator:(NSInteger)creator;
@end
