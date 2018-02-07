# Affi_SDK_iOS
#### Podfile

To integrate Affi_SDK_iOS into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

target 'TargetName' do
pod 'Affi_SDK_iOS'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage
## TextView

#### ADVCTextView

```objective-c
#import "ADLinkTextViewViewController.h"
#import "ADSelectLinkView.h"

@interface ADLinkTextViewViewController ()
@property (nonatomic,weak)  IBOutlet ADVCTextView *textView;
@end

@implementation ADLinkTextViewViewController

- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view from its nib.
//ハイライトリンク
[_textView setHLPramWithPid:@"HHHHHH" setCategoryId:@"xxx" setPtn:nil];
[_textView setView:self.view];
//リンクスイッチ
[_textView setLSPramWithPid:@"LLLLLL" setPtn:nil];
//TextViewの文字をLinkに変更します。
_textView.dataDetectorTypes = UIDataDetectorTypeLink;
//UITextViewDelegateを実装していない方はこちらをお使いください。
[_textView setTextViewDelegate];

}
```

#### TextView
### UITextViewDelegate

- (void)textViewDidChangeSelection:(UITextView *)textView

```objective-c
#import "ADLinkTextViewViewController.h"
#import "ADSelectLinkView.h"

@interface ADLinkTextViewViewController ()
@property (nonatomic,weak)  IBOutlet ADVCTextView *textView;
@end

@implementation ADLinkTextViewViewController

- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view from its nib.
//ハイライトリンク
[_textView setHLPramWithPid:@"HHHHHH" setCategoryId:@"xxx" setPtn:nil];]
[_textView setView:self.view];
//リンクスイッチ
[_textView setLSPramWithPid:@"LLLLLL" setPtn:nil];
//TextViewの文字をLinkに変更します。
_textView.dataDetectorTypes = UIDataDetectorTypeLink;

_textView.delegate = self;

}

//UITextViewDelegateを実装している方は以下のように設定してください。
#pragma mark - UITextViewDelegate
//文字を選択された時に呼び出されます。
- (void)textViewDidChangeSelection:(UITextView *)textView {
//選択されたTextViewをチェックして、広告を表示します。
[_textView checkTextView:textView];
}
//TextViewのリンクが踏まれた時に呼び出されます。
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
//広告リンクに変換します。
NSURL *changeURL = [_textView urlChanger:URL];

[[UIApplication sharedApplication] openURL:changeURL];

return NO;
}
```

<p align="center" >
<img src="https://ghe.valuecommerce.com/affiliate/affiliate-ios/blob/master/ADLink/UITextView.png" alt="UITextView" title="UITextView">
</p>

####  UIWebView

```objective-c
#import "ADLinkWebViewViewController.h"
#import "ADVCUIWebView.h"

@interface ADLinkWebViewViewController ()
@property (nonatomic, weak) IBOutlet ADVCUIWebView *webView;
@end

@implementation ADLinkWebViewViewController

- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view from its nib.
// URLを指定
NSURL *url = [NSURL URLWithString:@"Your site URL"];
NSURLRequest *request = [NSURLRequest requestWithURL:url];
// リクエストを投げる
[self.webView loadRequest:request];
//リンクスイッチ
[self.webView setLSParamsWithPinId:@"LLLLLL"];
//ハイライトリンク
[self.webView setHLParamsWithPinId:@"HHHHHH" categoryId:@"xxx"];
//広告用のViewをViewControllerに載せます。
[self.webView setViewController:self];
//Delegate
[self.webView setDelegate];//UIWebViewのdelegateをご使用の方は不要　その代わりDelegate内で処理を追記する必要あり。
}
```

### UIWebView
#### UIWebViewDelegate
```objective-c
#import "ADLinkWebViewViewController.h"
#import "ADVCUIWebView.h"

@interface ADLinkWebViewViewController ()
@property (nonatomic, weak) IBOutlet ADVCUIWebView *webView;
@end

@implementation ADLinkWebViewViewController

- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view from its nib.
// URLを指定
NSURL *url = [NSURL URLWithString:@"Your site URL"];
NSURLRequest *request = [NSURLRequest requestWithURL:url];
// リクエストを投げる
[self.webView loadRequest:request];

//リンクスイッチ
[self.webView setLSParamsWithPinId:@"LLLLLL"];
//ハイライトリンク
[self.webView setHLParamsWithPinId:@"HHHHHH" categoryId:@"xxx"];
//広告用のViewをViewControllerに載せます。
[self.webView setViewController:self];
}
//Delegateをご使用の場合は以下の記述をお願いします。
#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
return [self.webView webView:webView shouldStartLoadWithRequest:request navigationType:navigationType openURL:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{

[self.webView webViewDidFinishLoad];
}

```

### WKWebView

ADVCWKWebView.h

#### Creating a WKWebView

```objective-c
#import "ADLinkWKWebViewViewController.h"
#import "ADVCWKWebView.h"

@interface ADLinkWKWebViewViewController ()
@property (nonatomic, strong)  ADVCWKWebView *webView;
@end

@implementation ADLinkWKWebViewViewController

- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view from its nib.
// URLを指定
NSURL *url = [NSURL URLWithString:@"Your site URL"];
NSURLRequest *request = [NSURLRequest requestWithURL:url];
//上記のデリゲートをつなげていない場合
[self.webView setDelegate];
// リクエストを投げる
[self.webView loadRequest:request];
//リンクスイッチ
[self.webView setLSParamsWithPinId:@"LLLLLL"];
//ハイライトリンク
[self.webView setHLParamsWithPinId:@"HHHHHH" categoryId:@"xxx"];
//広告用のViewをViewControllerに載せます。
[self.webView setViewController:self];
}
```
### WKWebView
#### WKNavigationDelegate

```objective-c
#import "ADLinkWKWebViewViewController.h"
#import "ADVCWKWebView.h"

@interface ADLinkWKWebViewViewController ()<WKNavigationDelegate>
@property (nonatomic, strong)  ADVCWKWebView *webView;
@end

@implementation ADLinkWKWebViewViewController

- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view from its nib.
// URLを指定
NSURL *url = [NSURL URLWithString:@"Your site URL"];
NSURLRequest *request = [NSURLRequest requestWithURL:url];

// リクエストを投げる
[self.webView loadRequest:request];
//リンクスイッチ
[self.webView setLSParamsWithPinId:@"LLLLLL"];
//ハイライトリンク
[self.webView setHLParamsWithPinId:@"HHHHHH" categoryId:@"xxx"];
//広告用のViewをViewControllerに載せます。
[self.webView setViewController:self];
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

```


<p align="center" >
<img src="https://ghe.valuecommerce.com/affiliate/affiliate-ios/blob/master/ADLink/WKWebView.png" alt="WebView" title="WebView">
</p>

## LinkSwitch
#### LinkSwitch

UITextView,UIWebView,WKWebViewをご使用でない方のLinkSwitchのサンプルになります。
こちらの例ではUIButtonでのご使用を想定で記載しています。

```objective-c
#import "ADVCLinkSwitchViewController.h"
#import "ADVCLinkSwitch.h"

@interface ADVCLinkSwitchViewController ()
@property (nonatomic,strong) ADVCLinkSwitch *linkSwitch;
@end

@implementation ADVCLinkSwitchViewController

- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view from its nib.
_linkSwitch = [[ADVCLinkSwitch alloc] init];
[_linkSwitch setLSPramWithPid:@"LLLLLL" setPtn:nil];
}

-(IBAction)linkSwitchAction:(id)sender{
NSURL *url = [NSURL URLWithString:@"Your site URL"];
if([self.linkSwitch urlChangerURL:url]){
url = [self.linkSwitch urlChanger:url];
}
[[UIApplication sharedApplication] openURL:url];
}


@end
```
