//
//  UserDetailViewController.h
//  TestObjC
//
//  Created by Faza Azizi on 14/04/25.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserDetailViewController : UIViewController

@property (nonatomic, strong) UserModel *user;

- (instancetype)initWithUser:(UserModel *)user;

@end

NS_ASSUME_NONNULL_END
