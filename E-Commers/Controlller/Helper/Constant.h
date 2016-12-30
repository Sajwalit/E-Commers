//
//  Constant.h
//  LCall
//
//  Created by Mine on 3/5/16.
//  Copyright © 2016 HMW. All rights reserved.
//

#ifndef Constant_h
#define Constant_h


#endif /* Constant_h */

// iPhone 5 5c 5s
#define XScale [[UIScreen mainScreen] bounds].size.width / 320.0f
#define YScale [[UIScreen mainScreen] bounds].size.height / 568.0f


#define IS_IPhone5  ([[UIScreen mainScreen] bounds].size.height == 568)
#define IS_IPhone4  ([[UIScreen mainScreen] bounds].size.height == 480)
#define IS_IPhone6  ([[UIScreen mainScreen] bounds].size.height == 667)
#define IS_IPhone6P ([[UIScreen mainScreen] bounds].size.height == 736)


#define ViewWidth [[UIScreen mainScreen] bounds].size.width
#define ViewHeight [[UIScreen mainScreen] bounds].size.height


#pragma mark - WebService Requests 
