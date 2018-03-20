//
//  LSWKWebViewController.swift
//  ADLinkSwift
//
//  Created by Matsuki, Reiya (松木 玲也) on 2018/01/04.
//  Copyright © 2018年 ValueCommerce. All rights reserved.
//

import UIKit

class LSWKWebViewController: UIViewController {
    
    var webView:ADVCWKWebView = ADVCWKWebView()
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
            //WebView 下
            let webViewBottonConstraint = NSLayoutConstraint(item: webView,
                                                             attribute: NSLayoutAttribute.bottom,
                                                             relatedBy: NSLayoutRelation.equal,
                                                             toItem: self.view,
                                                             attribute: NSLayoutAttribute.bottom,
                                                             multiplier: 1.0,
                                                             constant: 0)
            self.view.addConstraint(webViewBottonConstraint)
            
            //WebView 上
            let webViewTopConstraint = NSLayoutConstraint(item: webView,
                                                          attribute: NSLayoutAttribute.top,
                                                          relatedBy: NSLayoutRelation.equal,
                                                          toItem: self.view,
                                                          attribute: NSLayoutAttribute.top,
                                                          multiplier: 1.0,
                                                          constant: 0)
            self.view.addConstraint(webViewTopConstraint)
            
            //WebView 右
            let webViewRightConstraint = NSLayoutConstraint(item: webView,
                                                            attribute: NSLayoutAttribute.right,
                                                            relatedBy: NSLayoutRelation.equal,
                                                            toItem: self.view,
                                                            attribute: NSLayoutAttribute.right,
                                                            multiplier: 1.0,
                                                            constant: 0)
            self.view.addConstraint(webViewRightConstraint)
            
            //WebView 左
            let webViewLeftConstraint = NSLayoutConstraint(item: webView,
                                                           attribute: NSLayoutAttribute.left,
                                                           relatedBy: NSLayoutRelation.equal,
                                                           toItem: self.view,
                                                           attribute: NSLayoutAttribute.left,
                                                           multiplier: 1.0,
                                                           constant: 0)
            self.view.addConstraint(webViewLeftConstraint)
        }
        
        let myURL = URL(string: "You are URL")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        // 1.setLSParamを呼び出します。
        let vc_pid = "xxxx"
        let vcptn  = "yyyy"
        webView.setLSParamsWithPid(vc_pid,ptn:vcptn)
        webView.setView(self.view)
        // 2.ADVCWebViewのsetDelegateを呼び出します。
        webView.setDelegate()
        
    }
    
    private func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        decisionHandler(self.webView.checkAdURL(with: navigationAction, webView:webView, openURL:true))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        self.webView.didFinishNavigation()
    }
    
}

