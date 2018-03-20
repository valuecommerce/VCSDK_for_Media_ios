//
//  ADVCLinkSwitch.h
//  VCSDK
//
//  Created by Matsuki, Reiya (松木 玲也) on 2017/11/17.
//  Copyright © 2017年 ValueCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ADVCLinkSwitch : NSObject
//インスタンスをシェアして、無駄な通信をしないよ
+ (instancetype)sharedManager;
//リンクスイッチ
-(void)setLSParamsWithPid:(NSString*)pid setPtn:(NSString*)ptn;
-(void)setLSParamsWithPid:(NSString*)pid setPtn:(NSString*)ptn setTargetURLList:(NSArray*)targetURLList;
-(void)setLSPramWithPid:(NSString*)pid setPtn:(NSString*)ptn setTargetURLList:(NSArray*)targetURLList __attribute__( (deprecated("Unsupported", "setLSParamsWithPid")) );
-(void)setLSPramWithPid:(NSString*)pid setPtn:(NSString*)ptn __attribute__( (deprecated("Unsupported", "setLSParamsWithPid")) );
//リンクスイッチ　ネイティブ
-(NSURL*)urlChanger:(NSURL*)url;
//URLをチェンジしたかどうかを返す。
-(BOOL)urlChangerURL:(NSURL*)url targetURLList:(NSArray*)targetURLList;
//リンクスイッチ WKWebView
-(NSURL*)urlChanger:(NSURL*)url cref:(NSString*)crefURLString;
//View payloadのために使います。
-(void)setView:(UIView*)view;
@end
