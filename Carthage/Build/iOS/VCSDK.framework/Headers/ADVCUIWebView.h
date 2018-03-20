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
//HLのpId
-(void)setHLParamsWithPid:(NSString*)pid;
//HLのpIdとptn
-(void)setHLParamsWithPid:(NSString*)pid ptn:(NSString*)ptn;
//HLのpIdとカテゴリー
-(void)setHLParamsWithPid:(NSString*)pid categoryId:(NSString*)categoryId;
//HLのpIdとカテゴリー ptn
-(void)setHLParamsWithPid:(NSString*)pid categoryId:(NSString*)categoryId ptn:(NSString*)ptn;

//リンクスイッチのpId
-(void)setLSParamsWithPid:(NSString*)pid;
//リンクスイッチのpIdとptn
-(void)setLSParamsWithPid:(NSString*)pid ptn:(NSString*)ptn;

-(void)setHLParamsWithPinId:(NSString*)PidId categoryId:(NSString*)categoryId __attribute__( (deprecated("Unsupported", "setHLParamsWithPid")) ) ;
-(void)setHLParamsWithPinId:(NSString*)PidId ptn:(NSString*)ptn __attribute__( (deprecated("Unsupported", "setHLParamsWithPid")) ) ;
-(void)setHLParamsWithPinId:(NSString*)PidId categoryId:(NSString*)categoryId ptn:(NSString*)ptn __attribute__( (deprecated("Unsupported", "setHLParamsWithPid")) ) ;

-(void)setHLParamsWithPinId:(NSString*)PidId __attribute__( (deprecated("Unsupported", "setHLParamsWithPid")) ) ;

-(void)setLSParamsWithPinId:(NSString*)PidId __attribute__( (deprecated("Unsupported", "setLSParamsWithPid")) );

-(void)setLSParamsWithPinId:(NSString*)PidId ptn:(NSString*)ptn __attribute__( (deprecated("Unsupported", "setLSParamsWithPid")) );

//リンクスイッチを利用する方でWKWebViewのUINavigationDelegateをつなげていない方はこちらを使用してください。
-(void)setDelegate;
//URLを見て広告にするか判断します。
-(NSURL*)urlChanger:(NSURL*)url;
//URL判定 YESで外部ブラウザ　NOでアプリ内ブラウザ
-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType openURL:(BOOL)openURL;
//Loadが終了したタイミングで呼び出してください。
-(void)webViewDidFinishLoad;
@end
