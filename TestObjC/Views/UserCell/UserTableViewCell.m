//
//  UserTableViewCell.m
//  TestObjC
//
//  Created by Faza Azizi on 14/04/25.
//

#import "UserTableViewCell.h"
#import "UserModel.h"

@interface UserTableViewCell()

@property (strong, nonatomic) UILabel *idLabel;
@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation UserTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setupViews {
    self.idLabel = [[UILabel alloc] init];
    self.idLabel.textColor = [UIColor darkGrayColor];
    self.idLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.idLabel];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.titleLabel];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.idLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:16],
        [self.idLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:12],
        [self.idLabel.widthAnchor constraintLessThanOrEqualToConstant:80],
        
        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:16],
        [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-16],
        [self.titleLabel.topAnchor constraintEqualToAnchor:self.idLabel.bottomAnchor constant:8],
        [self.titleLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-12]
    ]];
}

- (void)configureCell:(UserModel *)user {
    
    self.titleLabel.text = user.title;
    self.idLabel.text = [NSString stringWithFormat:@"ID: %@", user.id];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
