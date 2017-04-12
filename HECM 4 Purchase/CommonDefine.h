//
//  CommonDefine.h
//  EuroGuess
//
//  Created by MAdept on 12/05/16.
//  Copyright © 2016 MadeptSolutions pvt ltd. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h

#import "AppDelegate.h"



#define kAPIEndpoint @"https://www.watchlive.mobi/watchlive/apis/frontend_ws.php"
#define addEventAPIEndPoint @"https://www.watchlive.mobi/watchlive/apis/web_services.php"

//#define kAPIEndpoint @"http://192.168.1.47/watchlive/apis/frontend_ws.php"


//#define kAPIEndpoint @"http://192.168.1.41:8081/watchlive/apis/frontend_ws.php"
//#define addEventAPIEndPoint @"http://192.168.1.41:8081/watchlive/apis/web_services.php"

#define kOFFSET_FOR_KEYBOARD 80.0

#define SHADOW_RADIUS 1.0

#define SHADOW_COLOR [UIColor colorWithRed:184.0/255.0 green:189.0/255.0 blue:195.0/255.0 alpha:1.0]

#define SHADOW_OFFSET CGSizeMake(3.0f,3.0f)

#define SHADOW_OPACITY 1.0

#define BLUE_BORDER_COLOR [UIColor colorWithRed:96.0/255.0 green:169.0/255.0 blue:220.0/255.0 alpha:1.0]

#define GREEN_BORDER_COLOR [UIColor colorWithRed:106.0/255.0 green:194.0/255.0 blue:143.0/255.0 alpha:1.0]

#define YELLOW_BORDER_COLOR [UIColor colorWithRed:(212/255.0) green:(210/255.0) blue:(37/255.0) alpha:1.0]

#define GREY_BORDER_COLOR [UIColor colorWithRed:(168/255.0) green:(169/255.0) blue:(173/255.0) alpha:1.0]

#define SCORE_LBL_BORDER_COLOR [UIColor colorWithRed:147.0/255.0 green:147.0/255.0 blue:151.0/255.0 alpha:1.0]

#define BLACK_BORDER_COLOR [UIColor blackColor]

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_4 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0)

#define IS_IPHONE_4S (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0)

#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)

#define IS_IPHONE_6 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)

#define IS_IPHONE_6AND_GREATER (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height >= 667.0)

#define IS_IPHONE_6PLUS (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0)

#define IS_IPHONE_6_PLUSANDGREATER (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height >= 736.0)

#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0)

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

#define kAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define IS_OS_LESS_THAN_7 ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)

#define IS_OS_GREATER_THAN_8 ([[[UIDevice currentDevice] systemVersion] floatValue] > 8.0)
#define IS_OS_EQUAL_AND_GREATER_THAN_10 ([[[UIDevice currentDevice] systemVersion] floatValue] >=10.0)

#define TICK   NSDate *startTime = [NSDate date]
#define TOCK  [startTime timeIntervalSinceNow]





#endif /* CommonDefine_h */
