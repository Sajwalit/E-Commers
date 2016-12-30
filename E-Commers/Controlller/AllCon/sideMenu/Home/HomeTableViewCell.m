//
//  HomeTableViewCell.m
//  E-Commers
//
//  Created by Codefrux Training on 18/10/16.
//  Copyright © 2016 codefruxTechonology. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}
//- (void) setAspectContraint:(NSLayoutConstraint *)aspectContraint {
//    
//    if (_aspectContraint != nil) {
//        [self.homeImage removeConstraint:_aspectContraint];
//    }
//    if (aspectContraint != nil) {
//        [self.homeImage addConstraint:aspectContraint];
//    }
//}
//
//- (void) prepareForReuse {
//    [super prepareForReuse];
//    self.aspectContraint = nil;
//}
//
//- (void)setPicture:(UIImage *)image {
//    
//    CGFloat aspect = image.size.width / image.size.height;
//    self.aspectContraint = [NSLayoutConstraint constraintWithItem:self.homeImage
//                                                        attribute:NSLayoutAttributeWidth
//                                                        relatedBy:NSLayoutRelationEqual
//                                                           toItem:self.homeImage
//                                                        attribute:NSLayoutAttributeHeight
//                                                       multiplier:aspect
//                                                         constant:0.0];
//    [self.homeImage setImage:image];
//}
@end
