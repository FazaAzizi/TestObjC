//
//  UserListViewModel.h
//  TestObjC
//
//  Created by Faza Azizi on 14/04/25.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserListViewModel : NSObject

@property (nonatomic, readonly) NSArray *userList;
@property (nonatomic, readonly) NSArray *filteredUsers;
@property (nonatomic, copy) void (^onUsersUpdated)(void);

- (void)fetchUser;
- (void)searchUsersWithText:(NSString *)searchText;
- (NSInteger)numberOfUsers;
- (UserModel *)userAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
