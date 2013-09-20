//
//  ContentClass.m
//  iKFU
//
//  Created by user on 14.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "ContentClass.h"
#import "DataBaseHandler.h"

NSMutableArray *eventsToFill;

@implementation ContentClass

+(NSArray *)eventsFill{
    DataBaseHandler *dbh = [DataBaseHandler getSharedInstance];
    eventsToFill = [[NSMutableArray alloc] init];
    for(int i = 0; i < MIN(10, <#B#>); i++) {
        NSString *title = [[dbh.eventDetails objectAtIndex:i] objectAtIndex:0];
        [eventsToFill addObject:title];
    }
    return eventsToFill;
};

@end
