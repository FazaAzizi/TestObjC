//
//  UserDetailViewController.m
//  TestObjC
//
//  Created by Faza Azizi on 14/04/25.
//

#import "UserDetailViewController.h"
#import "UserModel.h"

@interface UserDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *userIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation UserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"User Details";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configure:self.user];}

- (instancetype)initWithUser:(UserModel *)user {
    self = [super init];
    if (self) {
        _user = user;
    }
    return self;
}

- (void)configure:(UserModel *)user {
    self.titleLabel.text = [NSString stringWithFormat:@"Title : %@", user.title];
    self.idLabel.text = [NSString stringWithFormat:@"ID : %@", user.id];
    self.userIdLabel.text = [NSString stringWithFormat:@"User ID : %@", user.userId];
    self.descLabel.text = [NSString stringWithFormat:@"Body : %@", user.body];

}

@end
