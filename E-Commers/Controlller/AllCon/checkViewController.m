//
//  checkViewController.m
//  E-Commers
//
//  Created by Codefrux Training on 18/10/16.
//  Copyright © 2016 codefruxTechonology. All rights reserved.
//

#import "checkViewController.h"
#import "SWRevealViewController.h"
@interface checkViewController ()

@end

@implementation checkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSString * abc = [NSString stringWithFormat:@"abcdefghijklmnopqrstuvwxyz"];
//    NSMutableString *sss=[NSMutableString new];
//    int j=(int)([abc length]/5);
//    for (int i=0; i<=j; i++) {
//        int k= i*5;
//        NSString * newString;
//        if (i != j) {
//            newString = [abc substringWithRange:NSMakeRange(k,5)];
//            newString=[NSString stringWithFormat:@"\"%@\\n\"",newString];
//        }else{
//            newString = [abc substringWithRange:NSMakeRange(k,[abc length]-k)];
//            if (newString.length !=0)
//                newString=[NSString stringWithFormat:@"\"%@\\n\"",newString];
//        }
//        if (newString.length !=0)
//            [sss appendString:[NSString stringWithFormat:@"%@\n",newString]];
//    }
//    NSLog(@"%@",sss);
    
//    self.navigationController.navigationBar.barTintColor=[UIColor pxColorWithHexValue:@"333D49"];
//    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
//    
//    SWRevealViewController *revealController =[self revealViewController];
//    //    [revealController panGestureRecognizer];
//    [revealController tapGestureRecognizer];
//    
//    UIButton *backButton =[UIButton buttonWithType:UIButtonTypeCustom];
//    backButton.layer.masksToBounds=YES;
//    backButton.layer.cornerRadius=5;
////    backButton.layer.borderColor
////    backButton.layer.borderWidth
//    [backButton setFrame:CGRectMake(0.0f,0.0f,20.0f,20.0f)];
//
//    [backButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"menu.png"]]  forState:UIControlStateNormal];
//    [backButton addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//    [self.navigationItem setLeftBarButtonItem:addButton];
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
