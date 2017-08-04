//
//  BasicUtility+TableView.h
//  HaoYa
//
//  Created by Sola on 15/4/20.
//  Copyright (c) 2015年 Hao Ya. All rights reserved.
//

#import "BasicUtility.h"

@interface BasicUtility (TableView)

- (void)setTableViewSeparatorZero:(UITableView *)tableView;
- (void)setTableViewSeparatorZero:(UITableView *)tableView withLeftMargin:(CGFloat)letfMargin;

- (void)setTableViewCellSeparatorZero:(UITableViewCell *)tableViewCell;
- (void)setTableViewCellSeparatorZero:(UITableViewCell *)tableViewCell withLeftMargin:(CGFloat)letfMargin;;

@end
