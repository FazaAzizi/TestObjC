//
//  UserListViewModel.m
//  TestObjC
//
//  Created by Faza Azizi on 14/04/25.
//

#import "UserListViewModel.h"

@interface UserListViewModel()

@property (nonatomic, strong) NSArray *userList;
@property (nonatomic, strong) NSArray *filteredUsers;
@property (nonatomic, strong) NSString *currentSearchText;


@end

@implementation UserListViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _userList = @[];
        _filteredUsers = @[];
    }
    return self;
}

- (void)fetchUser {
    NSURL *url = [NSURL URLWithString:@"https://jsonplaceholder.typicode.com/posts"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetching data: %@", error.localizedDescription);
            return;
        }
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode != 200) {
            NSLog(@"HTTP Error: %ld", (long)httpResponse.statusCode);
            return;
        }
        
        NSError *jsonError;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"JSON Parsing Error: %@", jsonError.localizedDescription);
            return;
        }
        
        NSMutableArray *users = [NSMutableArray array];
        
        for (NSDictionary *post in jsonArray) {
            NSString *title = post[@"title"];
            NSNumber *id = post[@"id"];
            NSNumber *userId = post[@"userId"];
            NSString *body = post[@"body"];
            
            NSLog(@"Post: ID=%@, UserID=%@, Title=%@, Body=%@",
                  id,
                  userId,
                  title,
                  [body substringToIndex:MIN(30, body.length)]);
            
            UserModel *user = [[UserModel alloc] initWithTitle:title userId:userId id:id body:body];
            [users addObject:user];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.userList = users;
            self.filteredUsers = users;
            
            if (self.onUsersUpdated) {
                self.onUsersUpdated();
            }
        });
    }];
    
    
    [dataTask resume];
    
}

- (NSInteger)numberOfUsers {
    return [self.filteredUsers count];
}

- (void)searchUsersWithText:(nonnull NSString *)searchText {
    if (!searchText || [searchText length] == 0) {
        self.filteredUsers = self.userList;
    } else {
        NSString *lowercaseSearchText = [searchText lowercaseString];
        
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(UserModel *user, NSDictionary *bindings) {
            return [[user.title lowercaseString] containsString:lowercaseSearchText];
        }];
        
        self.filteredUsers = [self.userList filteredArrayUsingPredicate:predicate];
    }
    
    if (self.onUsersUpdated) {
        self.onUsersUpdated();
    }
}

- (nonnull UserModel *)userAtIndex:(NSInteger)index {
    if (index < 0 || index >= [self.filteredUsers count]) {
        return nil;
    }
    return self.filteredUsers[index];
}

@end
