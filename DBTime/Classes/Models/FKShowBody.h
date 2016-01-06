//
//  FKShowBody.h
//  逗逼时光
//
//  Created by QQ920924960 on 16-1-6.
//  Copyright (c) 2016年 com.zmosa. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FKShowContent;

@interface FKShowBody : NSObject

//"allNum": 15703,
//"allPages": 786,
//"contentlist": [],
//"currentPage": 1,
//"maxResult": 20,
//"ret_code": 0

@property (nonatomic, strong) NSNumber *allNum;
@property (nonatomic, strong) NSNumber *allPages;
@property (nonatomic, strong) NSArray *contentlist;
@property (nonatomic, strong) NSNumber *currentPage;
@property (nonatomic, strong) NSNumber *maxResult;
@property (nonatomic, strong) NSNumber *ret_code;

@end
