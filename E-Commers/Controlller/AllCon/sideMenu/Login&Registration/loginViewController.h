//
//  loginViewController.h
//  E-Commers
//
//  Created by Codefrux Training on 20/10/16.
//  Copyright © 2016 codefruxTechonology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *mobleNumber;
@property (strong, nonatomic) IBOutlet UITextField *password;
- (IBAction)forgotButtonAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *loginOut;
- (IBAction)loginAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *acv;

- (IBAction)newAccountAction:(id)sender;






@end
