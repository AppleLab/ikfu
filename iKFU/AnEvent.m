//
//  AnEvent.m
//  iKFU
//
//  Created by user on 20.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "AnEvent.h"

@implementation AnEvent

static AnEvent* _event;

@synthesize Date;
@synthesize  Time;
@synthesize  Name;
@synthesize  Theme;
@synthesize  Describe;

@synthesize  LastName;
@synthesize  FirstName;
@synthesize  Email;
@synthesize  Telephone;

-(id) init
{
    self = [super init];
    return self;
}

+(AnEvent*) event
{
    @synchronized(_event)
    {
        if (!_event)
            _event = [[AnEvent alloc] init];
        return _event;
    }
}

@end
