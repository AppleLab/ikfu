//
//  DescribeEvents.m
//  iKFU
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "DescribeEvents.h"

@interface DescribeEvents ()




@end

@implementation DescribeEvents




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
    array= [[NSArray alloc] init];
    array = [NSArray arrayWithObjects: @"Jan", @"Feb", @"March", @"April",
             @"May", @"June", @"July", @"Aug",@"Sep", @"Oct", @"Nov", @"Dec", nil];
    NSLog(@"count of array: %lu", (unsigned long)array.count);
    self.label1.text = @"Jan";
    indexOfMouth = 0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

//event performed when NEXT push
- (IBAction)ActionNext:(id)sender
{
    indexOfMouth++;
    if ([_label1.text isEqualToString: @"Dec"])
    {
        indexOfMouth = 0;
    }
    
    _label1.text = [array objectAtIndex:indexOfMouth];
}

//event performed when PREV push
- (IBAction)ActionPrev:(id)sender
{
    indexOfMouth--;
    if ([_label1.text isEqualToString: @"Jan"])
    {
        indexOfMouth += 12;
    }
    
    _label1.text = [array objectAtIndex:indexOfMouth];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


@end
