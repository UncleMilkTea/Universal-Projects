//
//  SUDataBasic.m
//  Universal Projects
//
//  Created by 侯 on 2017/4/16.
//  Copyright © 2017年 Suger. All rights reserved.
//

#import "SUDataBasic.h"
//#import <FMDB/FMDB.h>

@interface SUDataBasic ()

//@property (nonatomic, strong) FMDatabaseQueue *queue;

@end

@implementation SUDataBasic

/// 单例
sharedInstanceM

//- (void)openDataBaseName:(NSString *)dbName {
//    // 创建数据库路径
//    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
//    path = [path stringByAppendingPathComponent:dbName];
//    NSLog(@"%@", path);
//
//    // 在指定数据库路径的同时，如果数据库不存在，会自动创建并且打开
//    self.queue = [[FMDatabaseQueue alloc] initWithPath:path];
//
//    // 创建数据表 在事务中执行 SQL
//    [self.queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
//        // db 直接执行sql
//        //BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS product (rowId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, itemId text, num INTEGER);"];
//        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS product (itemId TEXT PRIMARY KEY NOT NULL, num INTEGER, isBigShopProduct INTEGER, type INTEGER);"];
//        if (result) {
//            NSLog(@"创表成功！ %@", [NSThread currentThread]);
//        }
//    }];
//}

/// 插入
//- (BOOL)intertInToWhrerProductModel:(CSProductFmdbModel *)model {
//    __block BOOL result = NO;
//    [self.queue inDatabase:^(FMDatabase *db) {
//        NSString *sql = @"INSERT INTO product (itemId, num, isBigShopProduct, type) VALUES (?,?,?,?)";
//        NSNumber *num = [NSNumber numberWithInteger:model.num];
//        NSNumber *isBigShop = [NSNumber numberWithInteger:model.isBigShopProduct];
//        NSNumber *type = [NSNumber numberWithInteger:model.type];
//        result = [db executeUpdate:sql withArgumentsInArray:@[model.itemId, num, isBigShop, type]];
//        if (result) {
//            [self changeBadgeValue];
//        }
//    }];
//    return result;
//}
//
///// 更新
//+ (BOOL)updateWhereProductModel:(CSProductFmdbModel *)model {
//    __block BOOL result = NO;
//    [[FMDBManager sharedInstance].queue inDatabase:^(FMDatabase *db) {
//        NSString *sql = @"UPDATE product SET num = ?, isBigShopProduct = ?, type = ? WHERE itemId = ?";
//        NSNumber *num = [NSNumber numberWithInteger:model.num];
//        NSNumber *isBigShop = [NSNumber numberWithInteger:model.isBigShopProduct];
//        NSNumber *type = [NSNumber numberWithInteger:model.type];
//        result = [db executeUpdate:sql withArgumentsInArray:@[num, isBigShop, type, model.itemId]];
//        if (result) {
//            [self changeBadgeValue];
//        }
//    }];
//    return result;
//}
//
///** 查询全部商品数量 */
//+ (NSInteger)findAllProductsNumber {
//    __block NSInteger count = 0;
//    [[FMDBManager sharedInstance].queue inDatabase:^(FMDatabase *db) {
//        FMResultSet *resultSet = [db executeQuery:@"SELECT * FROM product;"];
//        while (resultSet.next) {
//            NSInteger num = [resultSet intForColumn:@"num"];
//            count += num;
//        }
//    }];
//    return count;
//}
//
///** 查询全部商品 */
//+ (NSArray *)findAllProducts {
//    __block NSMutableArray *array = [NSMutableArray array];
//    [[FMDBManager sharedInstance].queue inDatabase:^(FMDatabase *db) {
//        FMResultSet *resultSet = [db executeQuery:@"SELECT * FROM product;"];
//        while (resultSet.next) {
//            NSString *itemId = [resultSet stringForColumn:@"itemId"];
//            NSInteger num = [resultSet intForColumn:@"num"];
//            NSInteger isBigShop = [resultSet intForColumn:@"isBigShopProduct"];
//            NSInteger type = [resultSet intForColumn:@"type"];
//            CSProductFmdbModel *model = [[CSProductFmdbModel alloc] init];
//            model.itemId = itemId;
//            model.num = num;
//            model.isBigShopProduct = isBigShop;
//            model.type = type;
//            [array addObject:model];
//        }
//    }];
//    return [array copy];
//}
//
///** 查询单个商品 */
//+ (NSArray *)findByCriteriaWithID:(NSInteger)ID {
//    NSNumber *itemId = [NSNumber numberWithInteger:ID];
//    __block NSMutableArray *array = [NSMutableArray array];
//    [[FMDBManager sharedInstance].queue inDatabase:^(FMDatabase *db) {
//        NSString *sql = @"SELECT * FROM product WHERE itemId = ?;";
//        FMResultSet *resultSet = [db executeQuery:sql withArgumentsInArray:@[itemId]];
//        while (resultSet.next) {
//            CSProductFmdbModel *model = [[CSProductFmdbModel alloc] init];
//            model.itemId = [resultSet stringForColumn:@"itemId"];
//            model.num = [resultSet intForColumn:@"num"];
//            NSInteger isBigShop = [resultSet intForColumn:@"isBigShopProduct"];
//            NSInteger type = [resultSet intForColumn:@"type"];
//            model.isBigShopProduct = isBigShop;
//            model.type = type;
//            [array addObject:model];
//        }
//    }];
//    return array;
//}
//
///** 查询单个商品 */
//- (NSArray *)findByCriteriaWithType:(NSInteger)type {
//    NSNumber *types = [NSNumber numberWithInteger:type];
//    __block NSMutableArray *array = [NSMutableArray array];
//    self.queue inDatabase:^(FMDatabase *db) {
//        NSString *sql = @"SELECT * FROM product WHERE type = ?;";
//        FMResultSet *resultSet = [db executeQuery:sql withArgumentsInArray:@[types]];
//        while (resultSet.next) {
//            CSProductFmdbModel *model = [[CSProductFmdbModel alloc] init];
//            model.itemId = [resultSet stringForColumn:@"itemId"];
//            model.num = [resultSet intForColumn:@"num"];
//            NSInteger isBigShop = [resultSet intForColumn:@"isBigShopProduct"];
//            NSInteger type = [resultSet intForColumn:@"type"];
//            model.isBigShopProduct = isBigShop;
//            model.type = type;
//            [array addObject:model];
//        }
//    }];
//    return array;
//}
//
///// 根据ID删除指定的商品
//- (BOOL)deleteWhereProductIdIsEqueTo:(NSInteger)ID {
//    NSNumber *itemId = [NSNumber numberWithInteger:ID];
//    __block BOOL result = NO;
//    self.queue inDatabase:^(FMDatabase *db) {
//        NSString *sql = @"DELETE FROM product WHERE itemId = ?;";
//        result = [db executeUpdate:sql withArgumentsInArray:@[itemId]];
//        if (result) {
//            [self changeBadgeValue];
//        }
//    }];
//    return result;
//}
//
///// 根据类型删除商品
//- (BOOL)deleteWhereType:(NSInteger)type {
//    NSNumber *typenum = [NSNumber numberWithInteger:type];
//    __block BOOL result = NO;
//    self.queue inDatabase:^(FMDatabase *db) {
//        NSString *sql = @"DELETE FROM product WHERE type = ?;";
//        result = [db executeUpdate:sql withArgumentsInArray:@[typenum]];
//        if (result) {
//            [self changeBadgeValue];
//        }
//    }];
//    return result;
//}
//
///// 删除所有的商品
//- (BOOL)deleteAllData {
//    __block BOOL result = NO;
//    self.queue inDatabase:^(FMDatabase *db) {
//        result = [db executeUpdate:@"DELETE FROM product;"];
//        if (result) {
//            [self changeBadgeValue];
//        }
//    }];
//    return result;
//}
//
@end
