//
//  registrationViewController.h
//  E-Commers
//
//  Created by Codefrux Training on 21/10/16.
//  Copyright © 2016 codefruxTechonology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registrationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emilOrMobileTextField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordTextField;
@property (strong, nonatomic) IBOutlet UIButton *CreateOutlet;
- (IBAction)createAction:(id)sender;

@end
