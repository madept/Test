//
//  LoadingVC.m
//  HECM 4 Purchase
//
//  Created by Madept on 15/12/16.
//  Copyright © 2016 Madept. All rights reserved.
//

#import "LoadingVC.h"
#import "ResultVC.h"

@interface LoadingVC ()
{
    NSTimer *timer;
    int k;
}
@end

@implementation LoadingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    k = 1;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(test) userInfo:nil repeats:YES];
    
    CABasicAnimation *rotation;
    rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation.duration = 1.1; // Speed
    rotation.repeatCount = HUGE_VALF; // Repeat forever. Can be a finite number.
    [_loaderImage.layer addAnimation:rotation forKey:@"Spin"];
    
    // Do any additional setup after loading the view.
}

-(void)test
{
//    NSLog(@"TIMER DONE");
    
    if (k == 101) {
        [timer invalidate];
        timer = nil;
        ResultVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultVC"];
        vc.calculatedDownPayment = _calculatedDownPayment;
        vc.homepurchasePrice = _homepurchasePrice;
        vc.net_homePurchase = _net_homePurchase;
        vc.net_downpayment = _net_downpayment;
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        _progressLabel.text = [NSString stringWithFormat:@"%d %%",k];
        k++;
    }
   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
