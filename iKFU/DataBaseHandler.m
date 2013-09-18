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

- (NSString *) eventTitle {
    [database open];
    FMResultSet *results = [database executeQuery:@"select * from events"];
    NSString *eventTitle;
    while([results next]) {
        eventTitle = [results stringForColumn:@"title"];
    }
    [database close];
    return eventTitle;
}

- (NSString *) eventDate {
    [database open];
    FMResultSet *results = [database executeQuery:@"select * from events"];
    NSString *eventDate;
    while([results next]) {
        eventDate = [results stringForColumn:@"date"];
    }
    [database close];
    return eventDate;
}

- (NSMutableArray *) eventDetails {
    [database open];
    FMResultSet *results = [database executeQuery:@"select * from events"];
    NSMutableArray *events = [[NSMutableArray alloc] init];
    while([results next]) {
        //NSString *id1= [[NSNumber numberWithInt:[results intForColumnIndex:@"id"]] stringValue];
        NSString *ti = [results stringForColumn:@"title"];
        NSString *co = [results stringForColumn:@"content"];
        NSString *da = [results stringForColumn:@"date"];
        NSString *ty = [results stringForColumn:@"type"];
        //NSInteger *cr = [results stringForColumn:@"creator_id"];
        [events addObject:[NSMutableArray arrayWithObjects: ti, co, da, ty, nil]];
    }
    return events;
    [database close];
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
    query = @"select email, password from users";
    FMResultSet *results = [database executeQuery:query];
    while ([results next]) {
        NSString *email = [results stringForColumn:@"email"];
        NSString *pass  = [results stringForColumn:@"password"];
        NSLog(@"user: %@ %@", email, pass);
    }
    [database close];
}
@end
