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
//HLのpId
-(void)setHLParamsWithPid:(NSString*)pid;
//HLのpIdとカテゴリー
-(void)setHLParamsWithPid:(NSString*)pid categoryId:(NSString*)categoryId;
//pidとptn
-(void)setHLParamsWithPid:(NSString*)pid ptn:(NSString*)ptn;
//HLのpIdとカテゴリー ptn
-(void)setHLParamsWithPid:(NSString*)pid categoryId:(NSString*)categoryId ptn:(NSString*)ptn;
//リンクスイッチのpId
-(void)setLSParamsWithPid:(NSString*)pid;
//リンクスイッチのpIdとptn
-(void)setLSParamsWithPid:(NSString*)pid ptn:(NSString*)ptn;

-(void)setHLParamsWithPinId:(NSString*)PidId categoryId:(NSString*)categoryId __attribute__( (deprecated("Unsupported", "setHLParamsWithPid")) );
-(void)setHLParamsWithPinId:(NSString*)PidId ptn:(NSString*)ptn __attribute__( (deprecated("Unsupported", "setHLParamsWithPid")) );
-(void)setHLParamsWithPinId:(NSString*)PidId categoryId:(NSString*)categoryId ptn:(NSString*)ptn __attribute__( (deprecated("Unsupported", "setHLParamsWithPid")) );

-(void)setHLParamsWithPinId:(NSString*)PidId __attribute__( (deprecated("Unsupported", "setHLParamsWithPid")) );

-(void)setLSParamsWithPinId:(NSString*)PidId __attribute__( (deprecated("Unsupported", "setLSParamsWithPid")) );

-(void)setLSParamsWithPinId:(NSString*)PidId ptn:(NSString*)ptn __attribute__( (deprecated("Unsupported", "setLSParamsWithPid")) );

//リンクスイッチを利用する方でWKWebViewのUINavigationDelegateをつなげていない方はこちらを使用してください。
-(void)setDelegate;
//URLを見て広告にするか判断します。
-(NSURL*)urlChanger:(NSURL*)url;
//WKWebViewを仕様している方はこちらに入れてください。　openURL YESで外部ブラウザ Noでアプリないブラウザ
-(WKNavigationActionPolicy)checkAdURLWithNavigationAction:(WKNavigationAction *)navigationAction webView:(WKWebView*)webView openURL:(BOOL)opneURL;
//URLロード完了時に呼び出してください。
-(void)didFinishNavigation;
@end
