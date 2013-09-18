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
    NSString *title = [dbh eventTitle];
    [eventsToFill addObject:title];
    return eventsToFill;
};

@end
