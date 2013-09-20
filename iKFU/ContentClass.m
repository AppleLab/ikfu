//
//  ContentClass.m
//  iKFU
//
//  Created by user on 14.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "ContentClass.h"
#import "DataBaseHandler.h"

@implementation ContentClass
NSMutableArray *eventsToFill;

+(NSArray *)eventsFill:(NSInteger)limit{
    DataBaseHandler *dbh = [DataBaseHandler getSharedInstance];
    eventsToFill = [[NSMutableArray alloc] init];
    eventsToFill = [dbh eventDetails:limit];
    return eventsToFill;
};
+(NSArray *)eventsFillWithParticipant:(NSInteger)limit withpart:(NSInteger)part{
    DataBaseHandler *dbh = [DataBaseHandler getSharedInstance];
    eventsToFill = [[NSMutableArray alloc] init];
    eventsToFill = [dbh eventDetailsWithKnownParticipant:limit withCreator:part];
    return eventsToFill;
};
+(NSArray *)eventsFillWithCreator:(NSInteger)limit withcreator:(NSInteger)creator{
    DataBaseHandler *dbh = [DataBaseHandler getSharedInstance];
    eventsToFill = [[NSMutableArray alloc] init];
    eventsToFill = [dbh eventDetailsWithKnownCreator:limit withCreator:creator];
    return eventsToFill;
};
@end
