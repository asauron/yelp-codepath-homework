//
//  SwitchCell.m
//  Yelp
//
//  Created by Abinaya Sarva on 10/27/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "SwitchCell.h"

@interface SwitchCell()
//@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
- (IBAction)switchValueChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;

//@property (nonatomic, assign) BOOL on;
@property (nonatomic, weak) id<SwitchCellDelegate> delegate;

@end

@implementation SwitchCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)switchValueChanged:(id)sender {
    [self.delegate switchCell:self didUpdateValue:self.toggleSwitch.on];
}

- (void)setOn:(BOOL)on {
    [self setOn:on animated:NO];
}

- (void)setOn:(BOOL)on animated:(BOOL)animated {
    _on = on;
    [self.toggleSwitch setOn:on animated:animated];
    
}
@end
