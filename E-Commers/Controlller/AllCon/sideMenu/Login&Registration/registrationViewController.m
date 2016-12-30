//
//  registrationViewController.m
//  E-Commers
//
//  Created by Codefrux Training on 21/10/16.
//  Copyright © 2016 codefruxTechonology. All rights reserved.
//

#import "registrationViewController.h"

@interface registrationViewController ()

@end

@implementation registrationViewController
@synthesize nameTextField,emilOrMobileTextField,PasswordTextField,CreateOutlet;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addDesign{
    nameTextField.layer.masksToBounds=YES;
    nameTextField.layer.cornerRadius=3;
    nameTextField.layer.borderColor=[UIColor pxColorWithHexValue:@"D0D6DE"].CGColor;
    nameTextField.layer.borderWidth=1;
    
    emilOrMobileTextField.layer.masksToBounds=YES;
    emilOrMobileTextField.layer.cornerRadius=3;
    emilOrMobileTextField.layer.borderColor=[UIColor pxColorWithHexValue:@"D0D6DE"].CGColor;
    emilOrMobileTextField.layer.borderWidth=1;
    
    PasswordTextField.layer.masksToBounds=YES;
    PasswordTextField.layer.cornerRadius=3;
    PasswordTextField.layer.borderColor=[UIColor pxColorWithHexValue:@"D0D6DE"].CGColor;
    PasswordTextField.layer.borderWidth=1;
    
    CreateOutlet.layer.masksToBounds=YES;
    CreateOutlet.layer.cornerRadius=3;
    CreateOutlet.layer.borderColor=[UIColor pxColorWithHexValue:@"D0D6DE"].CGColor;
    CreateOutlet.layer.borderWidth=1;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)backButtonAction{
    [[self navigationController]popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)createAction:(id)sender {
}
@end
