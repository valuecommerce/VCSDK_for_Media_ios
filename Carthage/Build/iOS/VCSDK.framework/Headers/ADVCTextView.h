//
//  ADVCTextView.h
//  VCSDK
//
//  Created by Matsuki, Reiya (松木 玲也) on 2017/11/14.
//  Copyright © 2017年 ValueCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADVCTextView : UITextView
//必ずこちらを実装してください。 ViewControllerのView部分だとありがたいです。
-(void)setView:(UIView*)view;

-(void)setHLPramWithPid:(NSString*)pid;
-(void)setHLPramWithPid:(NSString*)pid setPtn:(NSString*)ptn;
//ハイライトリンク
-(void)setHLPramWithPid:(NSString*)pid setCategoryId:(NSString*)categoryId setPtn:(NSString*)ptn;
//リンクスイッチ
-(void)setLSPramWithPid:(NSString*)pid setPtn:(NSString*)ptn;
//UITextViewDelegateをご使用でない場合はこちらを呼び出してください。
-(void)setTextViewDelegate;

//ハイライトリンク
-(void)checkTextView:(UITextView*)textView;
//オートマイリンク
-(NSURL*)urlChanger:(NSURL*)url;
-(BOOL)urlChangerURL:(NSURL*)url;
@end
