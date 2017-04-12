//
//  ResultVC.h
//  HECM 4 Purchase
//
//  Created by Madept on 09/12/16.
//  Copyright © 2016 Madept. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultVC : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *calculateDownpaymentBtn;
@property (strong, nonatomic) IBOutlet UIButton *emailBtn;
@property (strong, nonatomic) IBOutlet UIButton *callBtn;
@property (strong, nonatomic) IBOutlet UILabel *homePurchasePriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *reverseMortgageLabel;
@property (strong, nonatomic) IBOutlet UILabel *estimatedDownPaymentLabel;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


- (IBAction)caluclateAnotherAction:(UIButton*)sender;
- (IBAction)emailUsAction:(UIButton*)sender;
- (IBAction)callUsAction:(UIButton*)sender;

@property double calculatedDownPayment;
@property double homepurchasePrice;
@property double net_homePurchase;
@property double net_downpayment;

@end
