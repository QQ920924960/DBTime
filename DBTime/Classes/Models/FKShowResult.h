//
//  FKShowResult.h
//  逗逼时光
//
//  Created by QQ920924960 on 16-1-6.
//  Copyright (c) 2016年 com.zmosa. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FKShowBody;

@interface FKShowResult : NSObject

//"showapi_res_code": 0,
//"showapi_res_error": "",
//"showapi_res_body": {

@property (nonatomic, strong) NSNumber *showapi_res_code;
@property (nonatomic, copy) NSString *showapi_res_error;
@property (nonatomic, strong) FKShowBody *showapi_res_body;

@end
