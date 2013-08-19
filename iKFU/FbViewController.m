//
//  FbViewController.m
//  iKFU
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "FbViewController.h"

@interface FbViewController ()

@end

@implementation FbViewController
@synthesize web;
@synthesize username, realName, ID, access_token, email, link;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self web] setDelegate:self];
	[web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.facebook.com/dialog/oauth?client_id=542269072488443&redirect_uri=https://www.facebook.com/connect/login_success.html&scope=email&display=wap&response_type=token"]]];
    [web setScalesPageToFit:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) closeWebView {
    [[self.view viewWithTag:1024] removeFromSuperview];
    [[self.view viewWithTag:1025] removeFromSuperview];
}

-(void) loginWithParams:(NSMutableDictionary *)params {
    ID = [params objectForKey:@"user_id"];
    access_token = [params objectForKey:@"access_token"];
    //Сохраняемся, ребят!
    [[NSUserDefaults standardUserDefaults] setValue:access_token forKey:@"vk_token"];
    [[NSUserDefaults standardUserDefaults] setValue:ID forKey:@"vk_id"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


-(void) webViewDidFinishLoad:(UIWebView *)webView {
    //создадим хеш-таблицу для хранения данных
    NSMutableDictionary* user = [[NSMutableDictionary alloc] init];
    //смотрим на адрес открытой станицы
    NSString *currentURL = webView.request.URL.absoluteString;
    NSLog(@"Web redirect: %@", currentURL);
    NSRange textRange =[[currentURL lowercaseString] rangeOfString:[@"access_token" lowercaseString]];
    //смотрим, содержится ли в адресе информация о токене
    if(textRange.location != NSNotFound){
        //Ура, содержится, вытягиваем ее
        NSArray* data = [currentURL componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"=&"]];
        [user setObject:[data objectAtIndex:1] forKey:@"access_token"];
        [user setObject:[data objectAtIndex:3] forKey:@"expires_in"];
        [user setObject:[data objectAtIndex:5] forKey:@"user_id"];
        //[self closeWebView];
        
        //передаем всю информацию специально обученному классу
        [[FbViewController sharedInstance] loginWithParams:user];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *yourViewController = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
        [self presentModalViewController:yourViewController animated:YES];
    }
}

+ (id)sharedInstance {
    static FbViewController *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[FbViewController alloc]init];
    });
    return __sharedInstance;
}

@end
