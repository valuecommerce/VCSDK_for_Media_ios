//
//  LSUITextViewController.swift
//  ADLinkSwift
//
//  Created by Matsuki, Reiya (松木 玲也) on 2018/01/04.
//  Copyright © 2018年 ValueCommerce. All rights reserved.
//

import UIKit

class LSUITextViewController: UIViewController {

    @IBOutlet var textView:ADVCTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.setLSParamを呼び出します。
        let vc_pid = "xxxx"
        let vcptn  = "yyyy"
        textView.setLSPramWithPid(vc_pid, setPtn: vcptn)
        
        // 2.TextViewの文字をLinkに変更します。
        textView.dataDetectorTypes = UIDataDetectorTypes.link
        
        // 3.UITextViewDelegateを実装していない方はこちらをお使いください。
        textView.setTextViewDelegate()
    }

}
