//
//  ViewController.m
//  FDTemplateLayoutCell
//
//  Created by liliguang on 2019/1/24.
//  Copyright © 2019 llg. All rights reserved.
//

#import "ViewController.h"
#import "FDModel.h"
#import "FDTableViewNibCell.h"
//#import "UITableView+FDTemplateLayoutCell.h"


#import <MJExtension/MJExtension.h>



@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSources;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self initDataSource];
    [self setupUI];
    
}
//MARK: - DataSource
- (void)initDataSource {
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *feedDicts = rootDict[@"feed"];
    self.dataSources = [NSMutableArray array];
    for (NSDictionary *dict in feedDicts) {
        [self.dataSources addObject: [FDModel mj_objectWithKeyValues:dict]];
    }
    NSLog(@"%@",self.dataSources);
}

//MARK: - UI
- (void)setupUI {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    [tableView registerNib:[UINib nibWithNibName:@"FDTableViewNibCell" bundle:nil] forCellReuseIdentifier:@"FDTableViewNibCell"];
    [self.view addSubview:tableView];
    
}


//MARK: - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FDTableViewNibCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FDTableViewNibCell"];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}


- (void)configureCell:(FDTableViewNibCell *)cell atIndexPath:(NSIndexPath *)indexPath {
//    cell.fd_enforceFrameLayout = NO; // Enable to use "-sizeThatFits:"
    if (indexPath.row % 2 == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    //模型赋值
    cell.model = self.dataSources[indexPath.row];
}



@end

