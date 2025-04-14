//
//  UserTableViewCell.h
//  TestObjC
//
//  Created by Faza Azizi on 14/04/25.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"


@interface UserTableViewCell : UITableViewCell
- (void)configureCell:(UserModel *)user;

@end
