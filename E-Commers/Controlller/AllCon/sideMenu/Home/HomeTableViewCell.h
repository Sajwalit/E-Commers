//
//  HomeTableViewCell.h
//  E-Commers
//
//  Created by Codefrux Training on 18/10/16.
//  Copyright © 2016 codefruxTechonology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *homeImage;
@property (nonatomic, strong) NSLayoutConstraint *aspectContraint;
//- (void)setPicture:(UIImage *)image;
@end
