//
//  ContentClass.h
//  iKFU
//
//  Created by user on 14.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentClass : NSObject

+(NSArray *)eventsFill:(NSInteger)limit;
+(NSArray *)eventsFillWithCreator:(NSInteger)limit withcreator:(NSInteger)creator;
+(NSArray *)eventsFillWithParticipant:(NSInteger)limit withpart:(NSInteger)part;
@end
