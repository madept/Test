//
//  HomePageVC.h
//  HECM 4 Purchase
//
//  Created by Madept on 09/12/16.
//  Copyright © 2016 Madept. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageVC : UIViewController


@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITextField *homePurchasePricetxtField;
@property (strong, nonatomic) IBOutlet UITextField *firstBorrowertxtField;
@property (strong, nonatomic) IBOutlet UITextField *secondBorrowertxtField;
@property (strong, nonatomic) IBOutlet UIButton *checkBoxBtn;


- (IBAction)checkBoxClicked:(UIButton*)sender;
- (IBAction)calculateDownpaymentClicked:(UIButton*)sender;

@end
