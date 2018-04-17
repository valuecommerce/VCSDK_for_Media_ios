//
//  LSUIWebViewController.m
//  ADLink
//
//  Created by Matsuki, Reiya (松木 玲也) on 2017/12/19.
//  Copyright © 2017年 ValueCommerce. All rights reserved.
//

#import "LSUIWebViewController.h"
#import <VCSDK_for_Media_iOS/ADVCUIWebView.h>
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
    // 1.setLSParamを呼び出します。
    NSString *vc_pid = @"xxxx";
    NSString *vcptn  = @"yyyy";
    [self.webView setLSParamsWithPid:vc_pid ptn:vcptn];//リンクスイッチ
    // 2.ADVCWebViewのsetDelegateを呼び出します。
    [self.webView setDelegate];
    // 3.ViewControllerを渡してください。
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
