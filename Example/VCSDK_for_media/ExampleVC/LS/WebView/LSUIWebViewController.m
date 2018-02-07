//
//  LSUIWebViewController.m
//  ADLink
//
//  Created by Matsuki, Reiya (松木 玲也) on 2017/12/19.
//  Copyright © 2017年 ValueCommerce. All rights reserved.
//

#import "LSUIWebViewController.h"
#import <VCSDK/ADVCUIWebView.h>
@interface LSUIWebViewController ()<UIWebViewDelegate>
@property (nonatomic, weak) IBOutlet ADVCUIWebView *webView;
@end

@implementation LSUIWebViewController

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    //ViewControllerが破棄される時にこちらを呼び出します。
    [self.webView clearADView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // 1.setTargetURLListを呼び出します。
    NSArray *targetURLList = @[@"xxx.yyy.com", @"xxx.yyy.co.jp"];
    [self.webView setTargetURLList:targetURLList];
    
     // 2.setLSParamを呼び出します。
    NSString *vc_pid = @"xxxx";
    NSString *vcptn  = @"yyyy";
    [self.webView setLSParamsWithPinId:vc_pid ptn:vcptn];//リンクスイッチ
    // 3.ADVCWebViewのsetDelegateを呼び出します。
    [self.webView setDelegate];
    // 4.ViewControllerを渡してください。
    [self.webView setView:self.view];
    
    // URLを指定
    NSURL *url = [NSURL URLWithString:@"Your site URL"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // リクエストを投げる
    [self.webView loadRequest:request];
    
}


#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return [self.webView webView:webView shouldStartLoadWithRequest:request navigationType:navigationType openURL:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.webView webViewDidFinishLoad];
}

@end
