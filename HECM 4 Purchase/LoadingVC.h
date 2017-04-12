//
//  LoadingVC.h
//  HECM 4 Purchase
//
//  Created by Madept on 15/12/16.
//  Copyright © 2016 Madept. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingVC : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *progressLabel;
@property (strong, nonatomic) IBOutlet UIImageView *loaderImage;
@property double calculatedDownPayment;
@property double homepurchasePrice;
@property double net_homePurchase;
@property double net_downpayment;

@end
