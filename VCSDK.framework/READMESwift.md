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
#### Creating a UITextView

```Swift4.0
import UIKit

class ADLinkTextViewViewController: UIViewController,UITextViewDelegate {

var adView:ADSelectLinkView = ADSelectLinkView()

override func viewDidLoad() {
super.viewDidLoad()
adView.autolayoutAddSubView(view)
adView.setPinId("1234567890")

// Do any additional setup after loading the view.
}

func textViewDidChangeSelection(_ textView: UITextView) {
let location = textView.selectedRange.location
let length = textView.selectedRange.length
let selectText = (textView.text as NSString).substring(with: NSRange(location:location,length: length))
adView.checkSelectText(selectText)
}
}

```

### UITextViewDelegate

func textViewDidChangeSelection(_ textView: UITextView)


<p align="center" >
<img src="https://ghe.valuecommerce.com/t-rmatsuki/Affi_SDK_iOS/blob/master/ADLink/UITextView.png" alt="UITextView" title="UITextView">
</p>

### UIWebView

ADSelectLinkWebView.h

#### Creating a UIWebView

```Swift4.0

import UIKit

class ADLinkWebViewViewController: UIViewController {
@IBOutlet var webView:ADSelectLinkWebView!
override func viewDidLoad() {
super.viewDidLoad()
let favoriteURL = NSURL(string: "http://www.apple.com/iphone/")
let urlRequest = NSURLRequest(url: favoriteURL! as URL)
webView.loadRequest(urlRequest as URLRequest)
webView.setViewController(self)
webView.setPinId("1234567890")
}
}

```
### WKWebView

ADSelectLinkWKWebView.h

#### Creating a WKWebView

```Swift4
import UIKit

class ADLinkWKWebViewViewController: UIViewController {
var webView:ADSelectLinkWKWebView = ADSelectLinkWKWebView()
override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view.
webView.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(webView)
if #available(iOS 9.0, *) {
webView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
webView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
webView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
webView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
} else {
//ios8のコードは省略 AutoLayout
}
let myURL = URL(string: "https://www.apple.com")
let myRequest = URLRequest(url: myURL!)
webView.load(myRequest)
webView.setPinId("1234567890")
webView.setViewController(self)
}
}
```

<p align="center" >
<img src="https://ghe.valuecommerce.com/t-rmatsuki/Affi_SDK_iOS/blob/master/ADLink/UIWebView.png" alt="WebView" title="WebView">
</p>

## AutoMyLink

### WKWebView Delegate

```Swift4
internal func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

decisionHandler(ADAutoMyLinkURL.checkAdURL(with: navigationAction, webView: webView))
}
}
```

#### Creating a WKWebView

```Swift4
internal func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

decisionHandler(ADAutoMyLinkURL.checkAdURL(with: navigationAction, webView: webView))
}
}
```
