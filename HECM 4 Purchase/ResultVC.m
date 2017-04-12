//
//  ResultVC.m
//  HECM 4 Purchase
//
//  Created by Madept on 09/12/16.
//  Copyright © 2016 Madept. All rights reserved.
//

#import "ResultVC.h"
#import <MessageUI/MessageUI.h>
#import "CommonDefine.h"


@interface ResultVC ()<MFMailComposeViewControllerDelegate>
{
  MFMailComposeViewController *mailComposer;
}

@end

@implementation ResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.calculateDownpaymentBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.emailBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.emailBtn.layer.borderWidth = 1.5;
    self.callBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.callBtn.layer.borderWidth = 1.5;
    
    _homePurchasePriceLabel.text = [NSString stringWithFormat:@"$%@",[self formattedCurrencyStringFromString:_homepurchasePrice]];
    _estimatedDownPaymentLabel.text=[NSString stringWithFormat:@"$%@",[self formattedCurrencyStringFromString:(long)_calculatedDownPayment]];
    
    long reverseMortage = (long)_homepurchasePrice-(long)_calculatedDownPayment;
    _reverseMortgageLabel.text=[NSString stringWithFormat:@"$%@",[self formattedCurrencyStringFromString:reverseMortage]];
    // Do any additional setup after loading the view, typically from a nib.
       
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
- (IBAction)caluclateAnotherAction:(UIButton*)sender
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
}
- (IBAction)emailUsAction:(UIButton*)sender
{
    // Email Subject
//    NSString *emailTitle = @"Test Email";
    // Email Content
    NSString *messageBody = @"Write Message here!";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"Team.foody@pacresmortgage.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
//    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
    
}
- (IBAction)callUsAction:(UIButton*)sender
{
//    NSURL *phoneURL = [NSURL URLWithString:@"tel:9015156562"];
//    [[UIApplication sharedApplication] openURL:phoneURL];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:5034271667"]]];
    
}

#pragma mark - MFMailComposeResult Delegates
- (void) :(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
     [self dismissViewControllerAnimated:YES completion:NULL];
}
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSString*)formattedCurrencyStringFromString:(NSInteger)str
{
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    formatter.usesGroupingSeparator = YES;
    formatter.groupingSeparator = @",";
    formatter.groupingSize = 3;
    NSNumber *num = [NSNumber numberWithLongLong:str];
    NSString *formatted = [formatter stringFromNumber:num];
    return formatted;
}
@end
