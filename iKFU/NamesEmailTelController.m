//
//  NamesEmailTelController.m
//  iKFU
//
//  Created by user on 20.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "NamesEmailTelController.h"
#import "AnEvent.h"

@interface NamesEmailTelController ()

@end

@implementation NamesEmailTelController
@synthesize LastName;
@synthesize Name;
@synthesize Email;
@synthesize Telephone;


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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    [AnEvent event].LastName = LastName.text;
    [AnEvent event].Name = Name.text;
    [AnEvent event].Email = Email.text;
    [AnEvent event].Telephone = Telephone.text;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.25.30:3000/events"]];
    NSString* body = [NSString stringWithFormat:@"event[title]=%@&event[content]=%@&event[date]=%@&event[kind]=%@",[AnEvent event].LastName,[AnEvent event].FirstName,[AnEvent event].Email,[AnEvent event].Telephone];
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPMethod:@"POST"];
    [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSLog(@"%@ %@ %@ %@ %@ %@ %@ %@ %@ ",[AnEvent event].LastName,[AnEvent event].FirstName,[AnEvent event].Email,[AnEvent event].Telephone,[AnEvent event].Date,[AnEvent event].Time,[AnEvent event].Name,[AnEvent event].Theme,[AnEvent event].Describe);
    
    
    
    
}


@end
