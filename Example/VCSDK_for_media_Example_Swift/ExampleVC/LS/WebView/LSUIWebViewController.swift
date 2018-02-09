//
//  LSUIWebViewController.swift
//  ADLinkSwift
//
//  Created by Matsuki, Reiya (松木 玲也) on 2018/01/04.
//  Copyright © 2018年 ValueCommerce. All rights reserved.
//

import UIKit

class LSUIWebViewController: UIViewController {

    @IBOutlet var webView:ADVCUIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let favoriteURL = NSURL(string: "You Are URL")
        let urlRequest = NSURLRequest(url: favoriteURL! as URL)
        webView.loadRequest(urlRequest as URLRequest)
        
        // 1.setTargetURLListを呼び出します。
        let targetURLList = ["xxxdomain.co.jp/yyy", "zzzdomain.com"]
        webView.setTargetURLList(targetURLList)
        
        // 1.setLSParamを呼び出します。
        let vc_pid = "xxxx"
        let vcptn  = "yyyy"
        webView.setLSParamsWithPinId(vc_pid,ptn:vcptn)
        
        // 2.ADVCWebViewのsetDelegateを呼び出します。
        webView.setDelegate()
    }

}
