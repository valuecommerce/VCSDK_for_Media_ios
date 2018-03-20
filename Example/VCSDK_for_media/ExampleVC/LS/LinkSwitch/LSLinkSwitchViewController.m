//
//  LSLinkSwitchViewController.m
//  ADLink
//
//  Created by Matsuki, Reiya (松木 玲也) on 2017/12/19.
//  Copyright © 2017年 ValueCommerce. All rights reserved.
//

#import "LSLinkSwitchViewController.h"
#import <VCSDK/ADVCLinkSwitch.h>

@interface LSLinkSwitchViewController ()
@property (nonatomic,strong) ADVCLinkSwitch *linkSwitch;
@end

@implementation LSLinkSwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // 1.setLSParamを呼び出します。
    _linkSwitch = [[ADVCLinkSwitch alloc] init];
    [_linkSwitch setView:self.view];
    NSString *vc_pid = @"xxxx";
    NSString *vcptn  = @"yyyy";
    [_linkSwitch setLSParamsWithPid:vc_pid setPtn:vcptn setTargetURLList:nil];
}

-(IBAction)linkSwitchAction:(id)sender{
    NSURL *url = [NSURL URLWithString:@"Your site URL"];
    if([self.linkSwitch urlChangerURL:url targetURLList:nil]){
        url = [self.linkSwitch urlChanger:url];
    }
    [[UIApplication sharedApplication] openURL:url];
}



@end

