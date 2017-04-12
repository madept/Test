//
//  SplashVC.m
//  HECM 4 Purchase
//
//  Created by Madept on 15/02/17.
//  Copyright © 2017 Madept. All rights reserved.
//

#import "SplashVC.h"
#import "HomePageVC.h"

@interface SplashVC ()

@end

@implementation SplashVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self welcomeGreeting];
    NSLog(@"********** SPLASH *********");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self performSelector:@selector(openHomePage) withObject:nil afterDelay:4];
}

-(void)openHomePage
{
    HomePageVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"HomePageVC"];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)welcomeGreeting{
    NSLog(@"HI Welcome to github commit again and again");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
