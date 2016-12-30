//
//  HomeTableViewController.m
//  E-Commers
//
//  Created by Codefrux Training on 18/10/16.
//  Copyright © 2016 codefruxTechonology. All rights reserved.
//

#import "HomeTableViewController.h"
#import "HomeTableViewCell.h"
#import "SWRevealViewController.h"
#import "Constant.h"
@interface HomeTableViewController (){
    NSArray * imageName;
    UILabel *cartitemno;
}

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor=[UIColor pxColorWithHexValue:@"10133d"];
    //151a51  000066 0000b3  232f3e
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
    
    SWRevealViewController *revealController =[self revealViewController];
    //    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    UIButton *backButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setFrame:CGRectMake(0.0f,0.0f,20.0f,20.0f)];
    
    [backButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"menu.png"]]  forState:UIControlStateNormal];
    [backButton addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setLeftBarButtonItem:addButton];

    
    //cart button
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage=[[UIImage imageNamed:@"shopping_cart.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [backBtn setTintColor:[UIColor redColor]];
    [backBtn setImage:backBtnImage forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(mycart) forControlEvents:UIControlEventTouchUpInside];
    backBtn.tintColor=  [UIColor whiteColor];
    
    backBtn.frame = CGRectMake(XScale *0,YScale* 0,XScale * 33,YScale*  33);
    cartitemno=[[UILabel alloc]initWithFrame:CGRectMake(XScale*15,YScale* 3, XScale*15,YScale* 15)];
    cartitemno.textAlignment=NSTextAlignmentCenter;
    cartitemno.backgroundColor=[UIColor redColor];
    cartitemno.layer.masksToBounds=YES;
    cartitemno.layer.cornerRadius=cartitemno.frame.size.width/2;
    cartitemno.layer.borderWidth=1;
    cartitemno.layer.borderColor=[UIColor whiteColor].CGColor;
    [cartitemno setFont:[UIFont boldSystemFontOfSize:10]];
    [cartitemno setTextColor: [UIColor whiteColor]];
    cartitemno.hidden=YES; 
    
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(XScale*0,YScale* 0,XScale* 33,YScale* 33)];
    [customView addSubview:backBtn];
    [customView addSubview:cartitemno];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:customView];
    self.navigationItem.rightBarButtonItem = barButton;

    
    
    //other
    imageName=[NSArray arrayWithObjects:@"img0.jpg",@"img1.jpg",@"img2.jpg",@"img3.jpg",@"img4.jpg",@"img5.jpg",@"img6.jpg",@"img7.jpg",@"img8.jpg",@"img9.jpg",@"img10.jpg",@"img11.jpg",@"img12.jpg", nil];
    self.tableView.rowHeight=UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight=174;
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
    return imageName.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell" forIndexPath:indexPath];
    NSLog(@"image view size %f %f",cell.homeImage.frame.size.width,cell.homeImage.frame.size.height);
//    [cell setPicture:[UIImage imageNamed:[imageName objectAtIndex:indexPath.row]]];
    UIImage *img=[self adjustImageSizeWhenCropping:[UIImage imageNamed:[imageName objectAtIndex:indexPath.row]] imageview:cell.homeImage];
    cell.homeImage.image=img;
//    cell.homeImage.image=[UIImage imageNamed:[imageName objectAtIndex:indexPath.row]];
    
    
    // Configure the cell...
    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.imageView.frame.size.width, cell.imageView.frame.size.height)];
//    imageView.image=[UIImage imageNamed:[imageName objectAtIndex:indexPath.row]];
//    [imageView sizeToFit];
//    
//    CGSize h=[self imageSizeAfterAspectFit:imageView];
////    cell.homeImage=imageView;
////    cell.homeImage.image=[UIImage imageNamed:[imageName objectAtIndex:indexPath.row]];
//    UIImage *ggggg=[self imageWithImage:[UIImage imageNamed:[imageName objectAtIndex:indexPath.row]] convertToSize:h];
//    cell.homeImage.image=ggggg;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(CGSize)imageSizeAfterAspectFit:(UIImageView*)imgview{
    
    
    float newwidth;
    float newheight;
    
    UIImage *image=imgview.image;
    
    if (image.size.height>=image.size.width){
        newheight=imgview.frame.size.height;
        newwidth=(image.size.width/image.size.height)*newheight;
        
        if(newwidth>imgview.frame.size.width){
            float diff=imgview.frame.size.width-newwidth;
            newheight=newheight+diff/newheight*newheight;
            newwidth=imgview.frame.size.width;
        }
        
    }
    else{
        newwidth=imgview.frame.size.width;
        newheight=(image.size.height/image.size.width)*newwidth;
        
        if(newheight>imgview.frame.size.height){
            float diff=imgview.frame.size.height-newheight;
            newwidth=newwidth+diff/newwidth*newwidth;
            newheight=imgview.frame.size.height;
        }
    }
    
    NSLog(@"image after aspect fit: width=%f height=%f",newwidth,newheight);
    
    
    //adapt UIImageView size to image size
    //imgview.frame=CGRectMake(imgview.frame.origin.x+(imgview.frame.size.width-newwidth)/2,imgview.frame.origin.y+(imgview.frame.size.height-newheight)/2,newwidth,newheight);
    
    return CGSizeMake(newwidth, newheight);
    
}
- (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}
-(UIImage *)adjustImageSizeWhenCropping:(UIImage *)image imageview:(UIImageView *)imageview
{
    
    float actualHeight = image.size.height;
    
    float actualWidth = image.size.width;
    
    
    
    float ratio=imageview.frame.size.width/actualWidth;
    actualHeight = actualHeight*ratio;
    
    CGRect rect = CGRectMake(0.0, 0.0, imageview.frame.size.width, actualHeight);
    // UIGraphicsBeginImageContext(rect.size);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 1.0);
    [image drawInRect:rect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
    
    
}

@end
