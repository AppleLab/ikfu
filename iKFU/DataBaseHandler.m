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
    NSString *query = [NSString stringWithFormat:@"insert into users values (\"%@\", \"%@\")", email, password];
    [database executeUpdate:query];
    [database close];
}
@end
