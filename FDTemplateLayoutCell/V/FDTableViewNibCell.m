//
//  FDTableViewNibCell.m
//  FDTemplateLayoutCell
//
//  Created by liliguang on 2019/1/24.
//  Copyright © 2019 llg. All rights reserved.
//

#import "FDTableViewNibCell.h"

@interface FDTableViewNibCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end

@implementation FDTableViewNibCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(FDModel *)model {
    _model = model;
    self.titleLabel.text = model.title;
    self.contentLabel.text = model.content;
    self.contentImageView.image = model.imageName.length > 0 ? [UIImage imageNamed:model.imageName] : nil;
    self.usernameLabel.text = model.username;
    self.timeLabel.text = model.time;
}

@end
