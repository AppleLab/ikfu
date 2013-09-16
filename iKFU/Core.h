//
//  Core.h
//  iParking
//
//  Created by Ramil Garaev on 12.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Core : NSObject

+(Core*) core;

@property (atomic, strong) NSArray* events;
@property NSDate* date;
@property NSDate* time;
@property BOOL loggedin;

@end