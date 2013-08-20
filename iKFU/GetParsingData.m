

//
//  ParcerSortAddData.m
//  iKFU
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "GetParsingData.h"
#import "ViewController.h"
#import "DescribeEvents.h"
#import "Core.h"


@interface GetParsingData ()

@end

@implementation GetParsingData
@synthesize news;
@synthesize eventsType;
@synthesize parsedData;



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSString * const kImageTypeArray[] = {
        @"JPEG",
        @"PNG",
        @"GIF",
        @"PowerVR"
    };
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    eventsType = [[NSArray alloc]initWithObjects:@"All",@"Sport",@"Culture",@"Scientific", nil];

    @try {
        NSData * data =[[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://192.168.25.30:3000/events.json"]];
        NSLog(@"dataaaaaaa %@",data);
        NSArray* objects = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        [Core core].events = objects;
        NSLog(@"Core data %@", [Core core].events);
    }
    @catch (NSException *exception)
    {
        NSLog(@"I got a trooble with my server!!!!");
    }

    
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (void)viewDidUnload //iz
{
    [super viewDidUnload];
    //self.newsList = nil;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [eventsType count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EVENT";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
   
    cell.textLabel.text = [eventsType objectAtIndex:indexPath.row];
    
    
    return cell;
}



-(NSMutableArray*) GetData:(kImageType) key
{
    
    NSMutableArray* sortedData = [NSMutableArray array];
    for (int i=0; i < [Core core].events.count; i++)
    {
        [sortedData addObject:[[[Core core].events objectAtIndex:i] valueForKey:kImageTypeArray[key]]];
    }
    
    NSLog(@"i am here");
    return sortedData;
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

//In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
   
    DescribeEvents *vc = [[DescribeEvents alloc] init];
    vc = [segue destinationViewController];
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    vc.getData = news;//[eventsType objectAtIndex:path.row];
    
    
    
}



@end
