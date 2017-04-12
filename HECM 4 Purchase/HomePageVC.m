//
//  HomePageVC.m
//  HECM 4 Purchase
//
//  Created by Madept on 09/12/16.
//  Copyright © 2016 Madept. All rights reserved.
//

#import "HomePageVC.h"
#import "CommonDefine.h"
#import "ResultVC.h"
#import "LoadingVC.h"

@interface HomePageVC ()<UITextFieldDelegate>
{
    BOOL btnselected;
    UITextField *currentTextField;
    
}
@end

@implementation HomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    btnselected = NO;
    
    self.navigationController.navigationBarHidden = YES;
    
    self.firstBorrowertxtField.layer.borderColor = [UIColor whiteColor].CGColor;
    self.firstBorrowertxtField.layer.borderWidth = 1.5;
    self.secondBorrowertxtField.layer.borderColor = [UIColor whiteColor].CGColor;
    self.secondBorrowertxtField.layer.borderWidth = 1.5;
    
    self.secondBorrowertxtField.delegate = self;
    self.firstBorrowertxtField.delegate = self;
    self.homePurchasePricetxtField.delegate = self;
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]
                                               initWithTarget:self
                                               action:@selector(hideKeyBoard)];
    
    [self.view addGestureRecognizer:tapGesture];
    
 
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)hideKeyBoard
{
    [self.secondBorrowertxtField resignFirstResponder];
    [self.firstBorrowertxtField resignFirstResponder];
    [self.homePurchasePricetxtField resignFirstResponder];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - UITextFieldDelegates
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.secondBorrowertxtField resignFirstResponder];
    [self.firstBorrowertxtField resignFirstResponder];
    [self.homePurchasePricetxtField resignFirstResponder];
    return true;

}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    currentTextField=textField;
    if (textField.tag != 1 && (IS_IPHONE_5 || IS_IPHONE_4)) {
        [self.scrollView setContentOffset:CGPointMake(0, 100) animated:YES];
    }
    
   }
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self.scrollView setContentOffset:CGPointZero animated:YES];
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.tag != 1 && textField.text.length >= 3 && range.length == 0 ) {
        return NO;
    }
    else if (textField.tag == 1 && textField.text.length >= 10 && range.length == 0 ) {
        return NO;
    }
    else
        return YES;
}
#pragma mark - IBActions
- (IBAction)checkBoxClicked:(UIButton*)sender
{
    sender.selected =!sender.selected;
    if ( sender.selected) {
        btnselected = YES;
    }
    else
    {
        btnselected = NO;
    }
}
- (IBAction)calculateDownpaymentClicked:(UIButton*)sender
{
    if([_homePurchasePricetxtField.text isEqualToString:@""]){
        [self showAlert:@"Please enter home purchase price!"];
        return;
    }

    else if([_firstBorrowertxtField.text isEqualToString:@""]){
        [self showAlert:@"Please enter first borrower's age."];
        return;
    }
    else if([_firstBorrowertxtField.text integerValue] <62)
    {
        [self showAlert:@"First borrower must be at least 62 years of age."];
        return;
    }
    else if (btnselected == NO)
    {
        [self showAlert:@"Please confirm the condition. One borrower must be at least 62 years of age."];
        return;
    }
    
            [self calculatePayemnt];
  
    _checkBoxBtn.selected=NO;
    [currentTextField resignFirstResponder];
//    [self.scrollView setContentOffset:CGPointZero animated:YES];
}

#pragma mark - CalculateDownPayment
-(void)calculatePayemnt
{
    NSInteger homePurchase = [_homePurchasePricetxtField.text integerValue];
    NSInteger mainborrower;
    int global_index=0;
    double net_homepurchase=0;
    double gross_loan=0;
    double mip=0;
    double net_loan=0;
    double downpayment=0;
    double net_downpayment=0;
    NSInteger firstborrower= [_firstBorrowertxtField.text integerValue];
    NSInteger secondborrower= [_secondBorrowertxtField.text integerValue];
    NSArray *age_array = [[NSArray alloc] initWithObjects:@18,@19,@20,@21,@22,@23,@24,@25,@26,@27,@28,@29,@30,@31,@32,@33,@34,@35,@36,@37,@38,@39,@40,@41,@42,@43,@44,@45,@46,@47,@48,@49,@50,@51,@52,@53,@54,@55,@56,@57,@58,@59,@60,@61,@62,@63,@64,@65,@66,@67,@68,@69,@70,@71,@72,@73,@74,@75,@76,@77,@78,@79,@80,@81,@82,@83,@84,@85,@86,@87,@88,@89,@90,@91,@92,@93,@94,@95,@96,@97,@98,@99, nil];
    NSArray *loan_percent_array = [[NSArray alloc] initWithObjects:@31.70,@31.70,@32.60,@32.60,@32.60,@32.60,@32.60,@35.00,@35.00,@35.00,@35.00,@35.00,@37.30,@37.30,@37.30,@37.30,@37.30,@39.60,@39.60,@39.60,@39.60,@39.60,@42.00,@42.00,@42.00,@42.00,@42.00,@44.30,@44.30,@44.30,@44.30,@44.30,@46.00,@46.00,@46.00,@46.00,@46.00,@48.40,@48.90,@49.50,@50.00,@50.60,@51.10,@51.70,@52.40,@53.00,@53.60,@54.20,@54.90,@55.60,@56.20,@56.90,@57.60,@58.30,@59.10,@59.90,@60.60,@61.40,@62.20,@63.10,@64.00,@64.80,@65.70,@66.50,@67.40,@68.20,@69.00,@69.90,@70.90,@71.90,@72.90,@73.90,@75.00,@75.00,@75.00,@75.00,@75.00,@75.00,@75.00,@75.00,@75.00,@75.00,nil];
    if([_secondBorrowertxtField.text isEqualToString: @""] )
    {
        mainborrower=firstborrower;
    }
    else
    {
        if([_secondBorrowertxtField.text integerValue]<18)
        {
            mainborrower=firstborrower;
        }
        else
        {
            if([_firstBorrowertxtField.text integerValue ]>[_secondBorrowertxtField.text integerValue])
            {
                mainborrower=secondborrower;
            }
            else
            {
                mainborrower=firstborrower;
            }
        }
    }
    for(int i=0;i<82;i++)
    {
        if([age_array[i] integerValue]==mainborrower)
        {
            global_index=i;
            break;
        }
    }
    if(homePurchase>625500)
    {
        net_homepurchase=625500;
    }
    else
    {
        net_homepurchase=homePurchase;
    }
    
    gross_loan=(net_homepurchase/100)*[loan_percent_array[global_index] floatValue];
    mip=net_homepurchase*0.025;
    net_loan=gross_loan-mip;
    
    downpayment=homePurchase-net_loan;
    net_downpayment=net_homepurchase-net_loan;
    
    _homePurchasePricetxtField.text=@"";
    _firstBorrowertxtField.text=@"";
    _secondBorrowertxtField.text=@"";
    
    LoadingVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoadingVC"];
    vc.calculatedDownPayment = downpayment;
    vc.homepurchasePrice = homePurchase;
    vc.net_homePurchase = net_homepurchase;
    vc.net_downpayment = net_downpayment;

    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)showAlert:(NSString *)messsage
{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Alert!" message:messsage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
}
@end
