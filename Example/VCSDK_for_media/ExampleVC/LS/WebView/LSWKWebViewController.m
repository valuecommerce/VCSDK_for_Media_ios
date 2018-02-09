//
//  LSWKWebViewController.m
//  ADLink
//
//  Created by Matsuki, Reiya (松木 玲也) on 2017/12/19.
//  Copyright © 2017年 ValueCommerce. All rights reserved.
//

#import "LSWKWebViewController.h"
#import <VCSDK/ADVCWKWebView.h>

@interface LSWKWebViewController ()<WKNavigationDelegate, WKUIDelegate>
@property (nonatomic,strong)  ADVCWKWebView *webView;
@end

@implementation LSWKWebViewController

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    //ViewControllerが破棄される時にこちらを呼び出します。
    [self.webView clearADView];
}

- (void)loadView
{
    [super loadView];
    
    // WKWebView インスタンスの生成
    self.webView = [[ADVCWKWebView alloc]init];
    
    // Auto Layout の設定
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:1.0
                                                              constant:0],
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:1.0
                                                              constant:0]
                                ]];
    
    // フリップでの戻る・進むを有効にする
    self.webView.allowsBackForwardNavigationGestures = YES;
    
    // WKWebView インスタンスを画面に配置する
    [self.view insertSubview:self.webView atIndex:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // 1.setLSParamを呼び出します。
    NSString *vc_pid = @"xxxx";
    NSString *vcptn  = @"yyyy";
    [self.webView setLSParamsWithPinId:vc_pid ptn:vcptn];//リンクスイッチ
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

#pragma mark WKWebView Delegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    //openURL Yesの場合は外部ブラウザへ Noの場合はこちらのdelegateが繋がれているWebViewへ
    decisionHandler([self.webView checkAdURLWithNavigationAction:navigationAction webView:webView openURL:NO]);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    [self.webView didFinishNavigation];
}

@end
