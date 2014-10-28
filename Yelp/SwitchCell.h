//
//  SwitchCell.h
//  Yelp
//
//  Created by Abinaya Sarva on 10/27/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SwitchCell;

@protocol SwitchCellDelegate <NSObject>

- (void)switchCell:(SwitchCell *)cell didUpdateValue:(BOOL)value;

@end

@interface SwitchCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
- (void)setOn:(BOOL)on animated:(BOOL)animated;
@property (weak, nonatomic) id<SwitchCellDelegate> delegate;
@property (nonatomic, assign) BOOL on;


@end
