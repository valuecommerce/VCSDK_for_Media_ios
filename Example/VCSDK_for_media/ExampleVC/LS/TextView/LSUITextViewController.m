//
//  LSUITextViewController.m
//  ADLink
//
//  Created by Matsuki, Reiya (松木 玲也) on 2017/12/19.
//  Copyright © 2017年 ValueCommerce. All rights reserved.
//

#import "LSUITextViewController.h"
#import <VCSDK_for_Media_iOS/ADVCTextView.h>

@interface LSUITextViewController ()
@property (nonatomic,weak)  IBOutlet ADVCTextView *textView;
@end

@implementation LSUITextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // 1.setLSParamを呼び出します。
    NSString *vc_pid = @"xxxx";
    NSString *vcptn  = @"yyyy";
    [_textView setLSParamsWithPid:vc_pid setPtn:vcptn];
    // 2.TextViewの文字をLinkに変更します。
    _textView.dataDetectorTypes = UIDataDetectorTypeLink;
    // 3.UITextViewDelegateを実装していない方はこちらをお使いください。
    [_textView setTextViewDelegate];
    // 4.ViewController上のViewを渡してください。
    [_textView setView:self.view];
}

//UITextViewDelegateを実装している方は以下のように設定してください。
#pragma mark - UITextViewDelegate
//TextViewのリンクが踏まれた時に呼び出されます。
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    if([_textView urlChangerURL:URL]){
        //外部ブラウザに飛ばすなり、WebViewを生成して、アプリないで広告を表示したりご自由にこちらのURLをご使用ください。
        NSURL *changeURL = [_textView urlChanger:URL];
        //外部へ飛ばす
        [[UIApplication sharedApplication] openURL:changeURL];
        return NO;
    }
    
    return YES;
}

@end
