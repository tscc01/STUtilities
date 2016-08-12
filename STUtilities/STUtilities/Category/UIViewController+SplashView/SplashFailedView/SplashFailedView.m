//
//  SplashFailedView.m
//  TengNiu
//
//  Created by Sola on 15/4/16.
//  Copyright (c) 2015年 Teng Niu. All rights reserved.
//

#import "SplashFailedView.h"
#import "STUtilities.h"

@interface SplashFailedView ()

@property (weak, nonatomic) IBOutlet UIView *viewNetError;
@property (weak, nonatomic) IBOutlet UIButton *btnReconnect;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonTopConstraint;

@end

@implementation SplashFailedView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib
{
    _btnReconnect.layer.cornerRadius = 5;
    _btnReconnect.layer.borderWidth = 1;
    _btnReconnect.layer.borderColor = [UIColor colorWithHexValue:@"999999"].CGColor;
}

- (void)setFailedState:(NSError*)dicInfo
{
    
}

- (IBAction)onButtonReconnectClicked:(id)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(st_reloadData)]) {
        [_delegate st_reloadData];
    }
}

@end
