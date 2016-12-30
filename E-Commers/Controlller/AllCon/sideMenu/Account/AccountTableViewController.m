//
//  AccountTableViewController.m
//  E-Commers
//
//  Created by Codefrux Training on 27/10/16.
//  Copyright © 2016 codefruxTechonology. All rights reserved.
//

#import "AccountTableViewController.h"
#import "AccountTableViewCell.h"
#import "SWRevealViewController.h"
@interface AccountTableViewController (){
    NSMutableArray * dataArray;
    NSArray * HeaderArr;
}

@end

@implementation AccountTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBar.barTintColor=[UIColor pxColorWithHexValue:@"10133d"];
    
    SWRevealViewController *revealController =[self revealViewController];
    //    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    UIButton *backButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setFrame:CGRectMake(0.0f,0.0f,20.0f,20.0f)];
    
    [backButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"menu.png"]]  forState:UIControlStateNormal];
    [backButton addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setLeftBarButtonItem:addButton];

    
    
    
    dataArray=[[NSMutableArray alloc]init];
    HeaderArr=[NSArray arrayWithObjects:@"Orders",@"Account Settings",@"Messagew Center",@"Personalization",@"App Preferences", nil];
    NSArray * arr1=[NSArray arrayWithObjects:@"Your orders",@"Your Subscribe and Save items",  nil];
    NSArray * arr2=[NSArray arrayWithObjects:@"Change account setting",@"Manage addresses",@"Manage Your Content and Devices",@"Add a credit or debit card",@"Manage payment options",@"Top-p your Gift Card Balance",@"Manage Prime Purchases",@"Review Your Purchases",@"Your Recently Viewed Items",@"Manage SMS Alerts",nil];
    NSArray * arr3=[NSArray arrayWithObjects:@"Your Messages", nil];
    NSArray * arr4=[NSArray arrayWithObjects:@"Wish List", nil];
    NSArray * arr5=[NSArray arrayWithObjects:@"Advertising Preferences", nil];
    [dataArray addObject:arr1];
    [dataArray addObject:arr2];
    [dataArray addObject:arr3];
    [dataArray addObject:arr4];
    [dataArray addObject:arr5];
    
    
    self.tableView.estimatedRowHeight = 80;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return HeaderArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[dataArray objectAtIndex:section]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccountTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
//    UIView * cellView=[[UIView alloc]initWithFrame:CGRectMake(15, 0, cell.frame.size.width - 30,cell.frame.size.height)];
    cell.cellView.layer.masksToBounds=YES;
    cell.cellView.layer.borderWidth=1;
    cell.cellView.layer.borderColor=[UIColor pxColorWithHexValue:@"D0D6DE"].CGColor;
//    [cell addSubview:cellView];
    
    
    cell.cellLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.cellLabel.numberOfLines = 0;
//    cell.cellLabel.font = [UIFont fontWithName:@"Helvetica" size:33.0];
//    text1.leftViewMode = UITextFieldViewModeAlways;
//    text1.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password.png"]];
    
    
    
    
    
    
//    NSString *cellText = [[dataArray objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    
    
    
    
    
    
    
//    UIFont *cellFont = cell.textLabel.font;
//    CGSize constraintSize = CGSizeMake(280.0f, 300.0f);
//    CGSize labelSize = [cellText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
//    cell.cellLabel.frame.size = constraintSize;
//    cell.cellLabel.text = cellText;
    cell.cellLabel.text=[[dataArray objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    
    return cell;
}


-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 25)];
    [headerView setBackgroundColor:[UIColor clearColor]];
    UILabel *headerLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, 0,self.tableView.bounds.size.width - 30 , 25)];
    headerLabel.text=[HeaderArr objectAtIndex:section];
    headerLabel.font=[UIFont fontWithName:@"HelveticaNeue-Bold" size:20];
    [headerView addSubview:headerLabel];
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
@end
