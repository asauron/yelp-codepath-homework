//
//  BusinessCell.m
//  Yelp
//
//  Created by Abinaya Sarva on 10/27/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "BusinessCell.h"
#import "UIImageView+AFNetworking.h"

@interface BusinessCell()
@property (weak, nonatomic) IBOutlet UIImageView *thumb;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dollarLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ratingsImageView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewsLabel;


@end

@implementation BusinessCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setBusiness:(Business *)business{
    _business = business;
    [self.thumb setImageWithURL:[NSURL URLWithString:self.business.imageURL]];
    self.nameLabel.text = self.business.name;
    self.reviewsLabel.text = [NSString stringWithFormat:@"%@ Reviews",  self.business.numReviews];
    [self.ratingsImageView setImageWithURL:[NSURL URLWithString:self.business.ratingImageURL]];
    
    self.addressLabel.text = self.business.address;
    
    self.distanceLabel.text = [NSString stringWithFormat:@"%.2f mi",  self.business.distance];
    self.categoryLabel.text = self.business.categories;
    
}

@end
