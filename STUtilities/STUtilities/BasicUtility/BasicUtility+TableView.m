//
//  BasicUtility+TableView.m
//  TengNiu
//
//  Created by Sola on 15/4/20.
//  Copyright (c) 2015年 Teng Niu. All rights reserved.
//

#import "BasicUtility+TableView.h"
#import "STContext.h"

@implementation BasicUtility (TableView)

- (void)setTableViewSeparatorZero:(UITableView *)tableView {
    tableView.separatorInset = UIEdgeInsetsZero;
    
    if ([[STContext sharedInstance] currentSystemVersion] > SystemVersion71) {
        tableView.layoutMargins = UIEdgeInsetsZero;
    }
}

- (void)setTableViewSeparatorZero:(UITableView *)tableView withLeftMargin:(CGFloat)letfMargin {
    tableView.separatorInset = UIEdgeInsetsMake(0, letfMargin, 0, 0);
    if ([[STContext sharedInstance] currentSystemVersion] > SystemVersion71) {
        tableView.layoutMargins = UIEdgeInsetsMake(0, letfMargin, 0, 0);
    }
}

- (void)setTableViewCellSeparatorZero:(UITableViewCell *)tableViewCell {
    tableViewCell.separatorInset = UIEdgeInsetsZero;
    if ([[STContext sharedInstance] currentSystemVersion] > SystemVersion71) {
        tableViewCell.layoutMargins = UIEdgeInsetsZero;
    }
}

- (void)setTableViewCellSeparatorZero:(UITableViewCell *)tableViewCell withLeftMargin:(CGFloat)letfMargin {
    tableViewCell.separatorInset = UIEdgeInsetsMake(0, letfMargin, 0, 0);
    if ([[STContext sharedInstance] currentSystemVersion] > SystemVersion71) {
        tableViewCell.layoutMargins = UIEdgeInsetsMake(0, letfMargin, 0, 0);
    }
}

@end
