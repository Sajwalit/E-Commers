//
//  sidemenuTableViewController.m
//  E-Commers
//
//  Created by Codefrux Training on 18/10/16.
//  Copyright © 2016 codefruxTechonology. All rights reserved.
//

#import "sidemenuTableViewController.h"
#import "sidemenuTableViewCell.h"
#import "CategoriesTableViewController.h"
#import "SWRevealViewController.h"
#import "HomeTableViewController.h"
#import "AccountTableViewController.h"

@interface sidemenuTableViewController (){
    NSMutableArray *allName;
}

@end

@implementation sidemenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor=[UIColor pxColorWithHexValue:@"10133d"];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont fontWithName:@"AvenirNext-Regular" size:21]}];

    NSArray * arr1=[NSArray arrayWithObjects:@"Home",@"Shop by Department",@"Today`s Deals", nil];
    NSArray * arr2=[NSArray arrayWithObjects:@"Your Orders",@"Your Wish List",@"Your Account",@"Gift Cards", nil];
    NSArray * arr3=[NSArray arrayWithObjects:@"Customer Servicce",@"Rate Our App",@"Legal & About",nil];
    allName=[NSMutableArray arrayWithObjects:arr1,arr2,arr3, nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return allName.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[allName objectAtIndex:section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    sidemenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sidemenuTableViewCell" forIndexPath:indexPath];
    cell.menuNmae.text = [[allName objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    // Configure the cell...
    
    return cell;
}
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 30)];
    if (section >=1)
        [headerView setBackgroundColor:[UIColor lightGrayColor]];
    else
        [headerView setBackgroundColor:[UIColor clearColor]];
    return headerView;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SWRevealViewController *reavealController=(SWRevealViewController *)self.revealViewController;
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:{
                    HomeTableViewController * data=[self.storyboard instantiateViewControllerWithIdentifier:@"HomeTableViewController"];
                    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:data];
                    [reavealController setFrontViewController:nav];
                    [reavealController setFrontViewPosition:FrontViewPositionLeft animated:YES];
                }
                    break;
                case 1:{
                    CategoriesTableViewController * data=[self.storyboard instantiateViewControllerWithIdentifier:@"CategoriesTableViewController"];
                    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:data];
                    [reavealController setFrontViewController:nav];
                    [reavealController setFrontViewPosition:FrontViewPositionLeft animated:YES];
                    
                }
                    break;
                default:{
                    HomeTableViewController * data=[self.storyboard instantiateViewControllerWithIdentifier:@"HomeTableViewController"];
                    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:data];
                    [reavealController setFrontViewController:nav];
                    [reavealController setFrontViewPosition:FrontViewPositionLeft animated:YES];

                }
                    break;
            }
            break;
        case 1:{
            switch (indexPath.row) {
                case 2:{
                    AccountTableViewController * data=[self.storyboard instantiateViewControllerWithIdentifier:@"AccountTableViewController"];
                    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:data];
                    [reavealController setFrontViewController:nav];
                    [reavealController setFrontViewPosition:FrontViewPositionLeft animated:YES];
                    
                }
                break;
                default:{
                    HomeTableViewController * data=[self.storyboard instantiateViewControllerWithIdentifier:@"HomeTableViewController"];
                    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:data];
                    [reavealController setFrontViewController:nav];
                    [reavealController setFrontViewPosition:FrontViewPositionLeft animated:YES];
                }
                break;
            }
            break;
        }
            
        default:{
            HomeTableViewController * data=[self.storyboard instantiateViewControllerWithIdentifier:@"HomeTableViewController"];
            UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:data];
            [reavealController setFrontViewController:nav];
            [reavealController setFrontViewPosition:FrontViewPositionLeft animated:YES];


            break;
        }
    }
    

}
@end
