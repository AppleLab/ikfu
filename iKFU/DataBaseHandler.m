//
//  DataBaseHandler.m
//  iKFU
//
//  Created by User on 16.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "DataBaseHandler.h"
static DataBaseHandler *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;

@implementation DataBaseHandler

+(DataBaseHandler*)getSharedInstance{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}

-(BOOL)createDB{
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString:
                    [docsDir stringByAppendingPathComponent: @"base.db"]];
    BOOL isSuccess = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath ] == YES)
    {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
        {
            sqlite3_close(database);
            return  isSuccess;
        }
        else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
        }
    }
    return isSuccess;
}
- (BOOL) checkAuth:(NSString *)email withpassword:(NSString *)password
{
    const char *dbpath = [databasePath UTF8String];
    NSLog(@"Database Path %s",dbpath);
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = @"select name from sqlite_master";
        NSLog(@"query: %@",querySQL);
        const char *query_stmt = [querySQL cStringUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"QUery stmt%s", query_stmt);
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        NSLog(@"code%d",sqlite3_prepare_v2(database,
                                       query_stmt, -1, &statement, NULL));
        if (sqlite3_prepare_v2(database,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            NSLog(@"Error %s while preparing statement", sqlite3_errmsg(database));
            int code = sqlite3_step(statement);
            if (code == SQLITE_ROW)
            {
                NSString *name = [[NSString alloc] initWithUTF8String:
                                  (const char *) sqlite3_column_text(statement, 0)];
                [resultArray addObject:name];
                NSString *department = [[NSString alloc] initWithUTF8String:
                                        (const char *) sqlite3_column_text(statement, 1)];
                [resultArray addObject:department];
                NSString *year = [[NSString alloc]initWithUTF8String:
                                  (const char *) sqlite3_column_text(statement, 2)];
                [resultArray addObject:year];
                NSLog(@"%@", resultArray);
                return YES;
            }
            else{
                NSLog(@"Error %s while preparing statement", sqlite3_errmsg(database));
                NSLog(@"%d",code);
                NSLog(@"Not found");
                return NO;
            }
            sqlite3_reset(statement);
        }
        NSLog(@"Error %s while preparing statement", sqlite3_errmsg(database));
    }
    return NO;
}
@end
