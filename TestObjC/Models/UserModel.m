//
//  UserModel.m
//  TestObjC
//
//  Created by Faza Azizi on 14/04/25.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)initWithTitle:(NSString*)title userId:(NSNumber*)userId id:(NSNumber*)id body:(NSString*)body {
    self = [super init];
    if (self) {
        self.title = title;
        self.id = id;
        self.userId = userId;
        self.body = body;
    }
    return self;
}

@end
