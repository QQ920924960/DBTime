//
//  FKViewController.m
//  DBTime
//
//  Created by QQ920924960 on 16-1-6.
//  Copyright (c) 2016年 com.zmosa. All rights reserved.
//

#import "FKViewController.h"
#import "FKShowResult.h"
#import "FKShowBody.h"
#import "FKShowContent.h"

static NSString *const APPKey = @"298bd4e1a55393cf1a3490cedc5213d9";

@interface FKViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *datas;
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation FKViewController

- (NSArray *)datas
{
    if (!_datas) {
        _datas = [NSArray array];
    }
    return _datas;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // loadData
    [self loadData];
    
    // setupUI
    [self setupTableView];
}

- (void)setupTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    FKShowContent *content = self.datas[indexPath.row];
    cell.textLabel.text = content.title;
    cell.detailTextLabel.text = content.text;
    return cell;
}

#pragma mark - UITableViewDatagate


#pragma mark - network
- (void)loadData
{
    NSString *httpUrl = @"http://apis.baidu.com/showapi_open_bus/showapi_joke/joke_text";
    NSString *httpArg = @"page=1";
    NSString *urlStr = [NSString stringWithFormat:@"%@?%@", httpUrl, httpArg];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [request setHTTPMethod:@"GET"];
    [request addValue:APPKey forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            NSLog(@"httpError: %@%ld", connectionError.localizedDescription, (long)connectionError.code);
        } else {
            NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
            NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"HttpResponseCode:%ld", (long)responseCode);
            NSLog(@"HttpResponseBody %@", responseString);
            
            NSDictionary *dict = [responseString mj_JSONObject];
            FKShowResult *showResult = [FKShowResult mj_objectWithKeyValues:dict];
            self.datas = showResult.showapi_res_body.contentlist;
            NSArray *temp = self.datas;
            [self.tableView reloadData];
            NSLog(@"%@", showResult);
        }
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
