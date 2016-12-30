//
//  loginViewController.m
//  E-Commers
//
//  Created by Codefrux Training on 20/10/16.
//  Copyright © 2016 codefruxTechonology. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController
@synthesize mobleNumber,password,loginOut,acv;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addDesign];
    // Do any additional setup after loading the view.
    //navigation bar
    self.navigationController.navigationBarHidden=NO;
    self.navigationController.navigationBar.barTintColor=[UIColor pxColorWithHexValue:@"10133d"];
    self.title=@"E-Commers.in";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont fontWithName:@"AvenirNext-Regular" size:21]}];
    //back button
    UIButton *backButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setFrame:CGRectMake(0.0f,0.0f,30.0f,30.0f)];
    [backButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"Close.png"]]  forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setLeftBarButtonItem:addButton];
}
-(void)addDesign{
    mobleNumber.layer.masksToBounds=YES;
    mobleNumber.layer.cornerRadius=3;
    mobleNumber.layer.borderColor=[UIColor pxColorWithHexValue:@"D0D6DE"].CGColor;
    mobleNumber.layer.borderWidth=1;

    password.layer.masksToBounds=YES;
    password.layer.cornerRadius=3;
    password.layer.borderColor=[UIColor pxColorWithHexValue:@"D0D6DE"].CGColor;
    password.layer.borderWidth=1;

    loginOut.layer.masksToBounds=YES;
    loginOut.layer.cornerRadius=3;
    loginOut.layer.borderColor=[UIColor pxColorWithHexValue:@"D0D6DE"].CGColor;
    loginOut.layer.borderWidth=1;

    acv.layer.masksToBounds=YES;
    acv.layer.cornerRadius=3;
    acv.layer.borderColor=[UIColor pxColorWithHexValue:@"D0D6DE"].CGColor;
    acv.layer.borderWidth=1;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backButtonAction{
    [[self navigationController]popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)forgotButtonAction:(id)sender {
}

- (IBAction)loginAction:(id)sender {
}

- (IBAction)newAccountAction:(id)sender {
}
@end
