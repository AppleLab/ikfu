//
//  DataBaseHandler.m
//  iKFU
//
//  Created by User on 16.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "DataBaseHandler.h"
#import "FMDatabase.h"

static DataBaseHandler *sharedInstance = nil;
static FMDatabase *database = nil;

@implementation DataBaseHandler

+(DataBaseHandler*)getSharedInstance{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}

-(BOOL)createDB{
    //определяем путь к файлу с базой
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"base.db"];
    //создаем подключение к базе
    database = [FMDatabase databaseWithPath:path];
    database.traceExecution = true; //выводит подробный лог запросов в консоль
    return true;
}
- (BOOL) checkAuth:(NSString *)email withpassword:(NSString *)password
{
    [database open];
    NSString *query = [NSString stringWithFormat:@"select * from users where email=\"%@\" and password=\"%@\"", email, password];
    FMResultSet *results = [database executeQuery:query];
    while ([results next]) {
        [database closeOpenResultSets];
        [database close];
        return YES;
    }
    [database close];
    return NO;
}
- (BOOL) checkEmail:(NSString *)email{
    [database open];
    NSString *query = [NSString stringWithFormat:@"select * from users where email=\"%@\"", email];
    FMResultSet *results = [database executeQuery:query];
    while ([results next]) {
        [database closeOpenResultSets];
        [database close];
        return YES;
    }
    [database close];
    return NO;
}
- (void) addUser:(NSString *)email withpassword:(NSString *)password{
    [database open];
    NSString *query = [NSString stringWithFormat:@"insert into users(email, password) values ('%@', '%@')", email, password];
    [database executeUpdate:query];
    [database close];
}
- (NSMutableArray *) getProfileInfo:(NSString *)email{
    NSMutableArray *content = [[NSMutableArray alloc]init];
    [database open];
    NSString *query =[NSString stringWithFormat:@"select email, name, faculty from users where email='%@'",email];
    FMResultSet *results = [database executeQuery:query];
    [results next];
    for (int i = 0; i < 3; i++) {
        NSString *info = [results stringForColumnIndex:i];
        if ([info isEqualToString:@""]){
            info = @"Не задано";
        }
        [content addObject:info];
    }
    [database close];
    return content;
}
@end
