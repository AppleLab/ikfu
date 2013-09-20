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

+(NSArray *)eventsFill:(NSInteger)limit{
    DataBaseHandler *dbh = [DataBaseHandler getSharedInstance];
    eventsToFill = [[NSMutableArray alloc] init];
    eventsToFill = [dbh eventDetails:limit];
    return eventsToFill;
};

@end
