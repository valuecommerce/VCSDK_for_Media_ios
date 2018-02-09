//
//  ADVCUIWebView.h
//  VCSDK
//
//  Created by Matsuki, Reiya (松木 玲也) on 2017/11/10.
//  Copyright © 2017年 ValueCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADVCUIWebView : UIWebView
-(void)clearADView;
//広告を載せるURLのリストをいれてください。
-(void)setTargetURLList:(NSArray*)urlList;
-(void)setView:(UIView*)view;
//ハイライトリンクのpId
-(void)setHLParamsWithPinId:(NSString*)pinId;
//ハイライトリンクのpIdとptn
-(void)setHLParamsWithPinId:(NSString*)pinId ptn:(NSString*)ptn;
//ハイライトリンクのpIdとカテゴリー
-(void)setHLParamsWithPinId:(NSString*)pinId categoryId:(NSString*)categoryId;
//ハイライトリンクのpIdとカテゴリー ptn
-(void)setHLParamsWithPinId:(NSString*)pinId categoryId:(NSString*)categoryId ptn:(NSString*)ptn;

//リンクスイッチのpId
-(void)setLSParamsWithPinId:(NSString*)pinId;
//リンクスイッチのpIdとptn
-(void)setLSParamsWithPinId:(NSString*)pinId ptn:(NSString*)ptn;

//リンクスイッチを利用する方でWKWebViewのUINavigationDelegateをつなげていない方はこちらを使用してください。
-(void)setDelegate;
//URLを見て広告にするか判断します。
-(NSURL*)urlChanger:(NSURL*)url;
//URL判定 YESで外部ブラウザ　NOでアプリ内ブラウザ
-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType openURL:(BOOL)openURL;
//Loadが終了したタイミングで呼び出してください。
-(void)webViewDidFinishLoad;
@end
