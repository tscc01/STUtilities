//
//  ViewController.m
//  STUtilities
//
//  Created by Sola on 16/8/11.
//  Copyright © 2016年 tscc-sola. All rights reserved.
//

#import "ViewController.h"
#import "STUtilities/STUtilities.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[STSafeCategory sharedInstance]enableSafeCategory];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
