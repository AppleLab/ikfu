//
//  AnEvent.h
//  iKFU
//
//  Created by user on 20.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnEvent : NSObject

@property NSDate* Date;
@property NSDate* Time;
@property NSString* Name;
@property NSString* Theme;
@property NSString* Describe;

@property NSString* LastName;
@property NSString* FirstName;
@property NSString* Email;
@property NSString* Telephone;

+(AnEvent*) event;

@end
