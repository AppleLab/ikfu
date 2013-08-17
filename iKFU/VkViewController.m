//
//  VkViewController.m
//  iKFU
//
//  Created by user on 15.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "VkViewController.h"

@interface VkViewController ()

@end

@implementation VkViewController
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
	[web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://oauth.vk.com/authorize?client_id=3822741&redirect_uri=http://oauth.vk.com/blank.html&display=touch&response_type=token&scope=offline"]]];
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
        [[VkViewController sharedInstance] loginWithParams:user];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *yourViewController = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
        [self presentModalViewController:yourViewController animated:YES];
        if([[NSUserDefaults standardUserDefaults]objectForKey:@"vk_token"] != nil){
            NSLog(@"hi");
        }
    }
    else {
        //Ну иначе сообщаем об ошибке...
        textRange =[[currentURL lowercaseString] rangeOfString:[@"access_denied" lowercaseString]];
        if (textRange.location != NSNotFound) {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Ooops! something gonna wrong..." message:@"Check your internet connection and try again!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
            [self closeWebView];
        }
    }
}

+ (id)sharedInstance {
    static VkViewController *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[VkViewController alloc]init];
    });
    return __sharedInstance;
}

@end
