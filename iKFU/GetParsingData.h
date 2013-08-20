
//
//  ParcerSortAddData.h
//  iKFU
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Core.h"

@interface GetParsingData : UITableViewController
//<UITableViewDelegate, UITableViewDataSource>

//@property (strong, nonatomic) IBOutlet UITableView *newsList;
@property (strong, nonatomic) NSMutableArray *news;

@property NSArray* parsedData;

@property (strong, nonatomic) NSArray* eventsType;

-(NSMutableArray*) GetData:(id) key;

@end

typedef enum {
    JPG,
    PNG,
    GIF,
    PVR
} kImageType;
NSString * const kImageTypeArray[];

