//
//  ContentClass.m
//  iKFU
//
//  Created by user on 14.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "ContentClass.h"

NSArray *eventsToFill;

@implementation ContentClass

+(NSArray *)eventsFill{
    eventsToFill = [NSArray arrayWithObjects:@"Event1", @"Event2", nil];
    return eventsToFill;
};

@end
