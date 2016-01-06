//
//  FKShowContent.h
//  逗逼时光
//
//  Created by QQ920924960 on 16-1-6.
//  Copyright (c) 2016年 com.zmosa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKShowContent : NSObject

//{
//    "ct": "2016-01-06 14:00:14.364",
//    "text": "商场试衣间,我摧门进去,见一美女正脱一半,我忙说声对不起,并及时关上了门。 美女瞪着我：“你先出去行吗?”",
//    "title": "说声对不起",
//    "type": 1
//}

@property (nonatomic, copy) NSString *ct;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSNumber *type;

@end
