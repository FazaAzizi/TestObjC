//
//  UserListViewController.m
//  TestObjC
//
//  Created by Faza Azizi on 14/04/25.
//

#import "UserListViewController.h"
#import "UserListViewModel.h"
#import "UserTableViewCell.h"

@interface UserListViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) UserListViewModel *viewModel;

@end

@implementation UserListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[UserListViewModel alloc] init];
    
    [self setupSearchBar];
    [self setupTableView];
    
    __weak typeof(self) weakSelf = self;
    self.viewModel.onUsersUpdated = ^{
        [weakSelf.tableView reloadData];
    };
    
    [self.viewModel fetchUser];
    
}

- (void)setupSearchBar {
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"Search user...";
    self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
}

- (void)setupTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UserTableViewCell class] forCellReuseIdentifier:@"UserCell"];}



- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell" forIndexPath:indexPath];

    UserModel *user = [self.viewModel userAtIndex:indexPath.row];
    [cell configureCell:user];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return [self.viewModel numberOfUsers];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self.viewModel searchUsersWithText:searchText];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

@end
