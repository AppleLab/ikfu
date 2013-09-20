//
//  MyEventViewController.m
//  iKFU
//
//  Created by User on 16.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "MyEventViewController.h"
#import "ContentClass.h"
#import "Core.h"

@interface MyEventViewController ()

@end

NSArray *content;

@implementation MyEventViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    if (![Core core].loggedin){
        [self performSegueWithIdentifier: @"authSegue" sender: self];
    }
    else{
        [Core core].partorcreate = NO;
        NSArray *myContent = [ContentClass eventsFillWithParticipant:[Core core].limit2 withpart:[Core core].id];
        NSMutableArray *content1 = [[NSMutableArray alloc]init];
        for (int i = 0; i < [myContent count]; i++){
            [content1 addObject:[[myContent objectAtIndex:i] objectAtIndex:1]];
        }
        content = [NSArray arrayWithArray:content1];
    }
    [super viewWillAppear:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //check_for_Auth
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [content count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"contentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [content objectAtIndex:indexPath.row];
    return cell;
}
- (IBAction)check:(id)sender {
    if (![Core core].partorcreate){
        [Core core].partorcreate = YES;
        [Core core].limit2 = 10;
        NSArray *myContent = [ContentClass eventsFillWithCreator:[Core core].limit2 withcreator:[Core core].id];
        NSMutableArray *content1 = [[NSMutableArray alloc]init];
        for (int i = 0; i < [myContent count]; i++){
            [content1 addObject:[[myContent objectAtIndex:i] objectAtIndex:1]];
        }
        content = [NSArray arrayWithArray:content1];
        [[self tv] reloadData];
    }
    else{
        [Core core].partorcreate = NO;
        [Core core].limit2 = 10;
        NSArray *myContent = [ContentClass eventsFillWithParticipant:[Core core].limit2 withpart:[Core core].id];
        NSMutableArray *content1 = [[NSMutableArray alloc]init];
        for (int i = 0; i < [myContent count]; i++){
            [content1 addObject:[[myContent objectAtIndex:i] objectAtIndex:1]];
        }
        content = [NSArray arrayWithArray:content1];
        [[self tv] reloadData];
    }
}
@end
