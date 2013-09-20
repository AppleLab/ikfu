//
//  Core.m
//  iParking
//
//  Created by Ramil Garaev on 12.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "Core.h"

static Core* _core;

@implementation Core
@synthesize events;
@synthesize loggedin;
@synthesize email;
@synthesize password;
@synthesize faculty;
@synthesize limit1;
@synthesize limit2;
@synthesize partorcreate;
@synthesize id;
-(id) init
{
    self = [super init];
    return self;
}

+(Core*) core
{
    @synchronized(_core)
    {
        if (!_core){
            _core = [[Core alloc] init];
            _core.limit1 = 10;
            _core.limit2 = 10;
            _core.partorcreate = false;
        }
        return _core;
    }
}

@end
