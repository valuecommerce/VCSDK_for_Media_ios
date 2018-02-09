//
//  ADVCWKWebView.h
//  VCSDK
//
//  Created by Matsuki, Reiya (松木 玲也) on 2017/11/10.
//  Copyright © 2017年 ValueCommerce. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface ADVCWKWebView : WKWebView
-(void)clearADView;
//広告を載せるURLのリストをいれてください。
-(void)setTargetURLList:(NSArray*)urlList;

-(void)setView:(UIView*)view;
//ハイライトリンクのpId
-(void)setHLParamsWithPinId:(NSString*)pinId;
//ハイライトリンクのpIdとカテゴリー
-(void)setHLParamsWithPinId:(NSString*)pinId categoryId:(NSString*)categoryId;
//pidとptn
-(void)setHLParamsWithPinId:(NSString*)pinId ptn:(NSString*)ptn;
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
//WKWebViewを仕様している方はこちらに入れてください。　openURL YESで外部ブラウザ Noでアプリないブラウザ
-(WKNavigationActionPolicy)checkAdURLWithNavigationAction:(WKNavigationAction *)navigationAction webView:(WKWebView*)webView openURL:(BOOL)opneURL;
//URLロード完了時に呼び出してください。
-(void)didFinishNavigation;
@end
