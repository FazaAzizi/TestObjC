//
//  UserModel.h
//  TestObjC
//
//  Created by Faza Azizi on 14/04/25.
//

#import <Foundation/Foundation.h>


@interface UserModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *body;

- (instancetype)initWithTitle:(NSString*)title userId:(NSNumber*)userId id:(NSNumber*)id body:(NSString*)body;

@end
