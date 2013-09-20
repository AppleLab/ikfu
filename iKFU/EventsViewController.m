//
//  EventsViewController.m
//  iKFU
//
//  Created by user on 14.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "EventsViewController.h"
#import "ContentClass.h"
#import "Core.h"

@interface EventsViewController ()
@end

@implementation EventsViewController {
    NSArray *content;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSArray *myContent = [ContentClass eventsFill:[Core core].limit1];
    NSMutableArray *content1 = [[NSMutableArray alloc] init];
    NSString *title;
    for(int i = 0; i < [myContent count]; i++) {
        if ([[[myContent objectAtIndex:i] objectAtIndex:3] isEqual: @"sport"]) {
            title = [[myContent objectAtIndex:i] objectAtIndex:0];
            [content1 addObject:title];
        }
    }
    content = [NSArray arrayWithArray:content1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [content count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"contentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [content objectAtIndex:indexPath.row];
    return cell;
}
@end
