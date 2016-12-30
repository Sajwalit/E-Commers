//
//  CategoriesTableViewController.m
//  E-Commers
//
//  Created by Codefrux Training on 24/10/16.
//  Copyright © 2016 codefruxTechonology. All rights reserved.
//

#import "CategoriesTableViewController.h"
#import "CategoriesTableViewCell.h"
#import "SWRevealViewController.h"
#import "HomeTableViewController.h"
@interface CategoriesTableViewController (){
    NSMutableArray * _objects;
}
@end
NSString *const keyIndent = @"keyIndent";
NSString *const keyTitle = @"keyTitle";
NSString *const keyChildren = @"keyChildren";
@implementation CategoriesTableViewController

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
    
    
    _objects=[[NSMutableArray alloc]init];
    NSData * data =[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"document" ofType:@"json"]];
    NSDictionary * dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSLog(@"%lu",(unsigned long)dic.count);
    for (int i = 0; i<(int)[[dic valueForKey:@"res"] count]; i++){
        [_objects addObject: [[dic valueForKey:@"res"] objectAtIndex:i]];
    }
    NSLog(@"%@",_objects);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _objects.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CategoriesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoriesTableViewCell" forIndexPath:indexPath];
    
    cell.textLabel.text = _objects[indexPath.row][keyTitle];
    
    cell.indentationWidth = 40;
    cell.indentationLevel = [_objects[indexPath.row][keyIndent] integerValue];
    
    
    cell.contentView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:(CGFloat)(cell.indentationLevel)/50.0];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag=100;
    CGRect frame = CGRectMake(0.0, 0.0, 20.0, 20.0);
    button.frame = frame;
    
    button.backgroundColor = [UIColor clearColor];
    cell.accessoryView = button;
    
    
    if([[[_objects objectAtIndex:indexPath.row]valueForKey:@"keyChildren"] count] > 0){
        [button setSelected:YES];
        UIImage *image =nil;
        if (button.isEnabled) {
            image =[UIImage imageNamed:@"PlusMath.png"];
            
        }else{
            image =[UIImage imageNamed:@"MinusMath .png"];
            
        }
//        UIImage *image =[UIImage imageNamed:@"PlusMath.png"];
        [button setBackgroundImage:image forState:UIControlStateNormal];
    }else{
        [button setSelected:NO];
         button.enabled=NO;
        UIImage *image =[UIImage imageNamed:@""];
        [button setBackgroundImage:image forState:UIControlStateNormal];
    }
    return cell;
}
#pragma mark - Table View Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if([[[_objects objectAtIndex:indexPath.row]valueForKey:@"keyChildren"] count] > 0){
        CategoriesTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        UIButton * btn=(UIButton *)[cell viewWithTag:100];
        UIImage *image=nil;
        if (btn.isEnabled) {
            btn.enabled=NO;
            image =[UIImage imageNamed:@"MinusMath .png"];
            
        }else{
            btn.enabled=YES;
            image =[UIImage imageNamed:@"PlusMath.png"];
            
        }
        [btn setBackgroundImage:image forState:UIControlStateNormal];

    }
    NSDictionary *dic = _objects[indexPath.row];
    NSInteger indentLevel = [_objects[indexPath.row][keyIndent] integerValue]; //indentLevel of the selected cell
    NSArray *indentArray = [_objects valueForKey:keyIndent]; //array of indents which are currently show on table
    
    BOOL indentChek = [indentArray containsObject:[NSNumber numberWithInteger:indentLevel]]; // check if  selected
    BOOL isChildrenAlreadyInserted = [_objects containsObject:dic[keyChildren]]; //checking contains children
    
    for (int i =0; i<indentArray.count; i++) {
        NSString *str=[NSString stringWithFormat:@"%@",[indentArray objectAtIndex:i]];
        NSString *str1=[NSString stringWithFormat:@"%ld",(long)indentLevel];
        if ([str isEqualToString:str1]) {
            indentChek=YES;
            break;
        }
    }
    for(NSDictionary *dicChildren in dic[keyChildren]){
        
        NSInteger index=[_objects indexOfObjectIdenticalTo:dicChildren];
        
        isChildrenAlreadyInserted=(index>0 && index!=NSIntegerMax); //checking contains children
        
        if(isChildrenAlreadyInserted) break;
        
    }
    
    
    if ( indentChek &&  isChildrenAlreadyInserted) {
        
        //all children from this category will be deleted
        [self miniMizeThisRows:_objects[indexPath.row][keyChildren] forTable:tableView withIndexpath:indexPath];
        
    }
    else if ([dic[keyChildren] count]) { //insert the children if contains
        
        NSMutableArray *ipsArray = [NSMutableArray new];
        NSArray *childArray = dic[keyChildren];
        
        NSInteger count = indexPath.row + 1;
        
        for (int i = 0; i < [dic[keyChildren] count]; i++,count++) {
            
            NSIndexPath *ip = [NSIndexPath indexPathForRow:count inSection:indexPath.section];
            [ipsArray addObject:ip];
            [_objects insertObject:childArray[i] atIndex:count];
            
        }
        
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:ipsArray withRowAnimation:UITableViewRowAnimationLeft];
        [self.tableView endUpdates];
        
        
    }else{ //the junior most children will navigate
        
//        [self performSegueWithIdentifier:@"showDetail" sender:indexPath];
        NSLog(@"last");
            SWRevealViewController *reavealController=(SWRevealViewController *)self.revealViewController;
        
        HomeTableViewController * data=[self.storyboard instantiateViewControllerWithIdentifier:@"HomeTableViewController"];
        UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:data];
        [reavealController setFrontViewController:nav];
        [reavealController setFrontViewPosition:FrontViewPositionLeft animated:YES];
    }
    
    
}

/*this method will check the category with its children, sub children and so on till the last indent occurs*/
//method to minimize all the child rows of that particular category
-(void)miniMizeThisRows:(NSArray*)ar forTable:(UITableView *)tableView withIndexpath:(NSIndexPath *)indexPath{
    
    for(NSDictionary *dicChildren in ar ) {
        
        NSUInteger indexToRemove=[_objects indexOfObjectIdenticalTo:dicChildren];
        
        NSArray *arrayChildren=[dicChildren valueForKey:keyChildren];
        
        if(arrayChildren && [arrayChildren count]>0){
            [self miniMizeThisRows:arrayChildren forTable:tableView withIndexpath:indexPath];//calling self method to remove  the childrens
        }
        
        if([_objects indexOfObjectIdenticalTo:dicChildren]!=NSNotFound) {
            
            //updating array
            [_objects removeObjectIdenticalTo:dicChildren];
            
            //deleting the row
            [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexToRemove inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationRight];
        }
    }
}

-(void)backButtonAction{
    [[self navigationController]popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
