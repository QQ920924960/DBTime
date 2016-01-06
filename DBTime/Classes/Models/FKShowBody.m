//
//  FKShowBody.m
//  逗逼时光
//
//  Created by QQ920924960 on 16-1-6.
//  Copyright (c) 2016年 com.zmosa. All rights reserved.
//

#import "FKShowBody.h"
#import "FKShowContent.h"

@implementation FKShowBody

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"contentlist" : [FKShowContent class]};
}

@end
