//
//  LSLinkSwitchViewController.swift
//  ADLinkSwift
//
//  Created by Matsuki, Reiya (松木 玲也) on 2018/01/04.
//  Copyright © 2018年 ValueCommerce. All rights reserved.
//

import UIKit
import VCSDK_for_Media_iOS
class LSLinkSwitchViewController: UIViewController {

    var linkSwitch:ADVCLinkSwitch = ADVCLinkSwitch()
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.setLSParamを呼び出します。
        let vc_pid = "xxxx"
        let vcptn  = "yyyy"
        linkSwitch.setView(self.view)
        linkSwitch.setLSParamsWithPid(vc_pid, setPtn: vcptn ,setTargetURLList:nil)
    }
    
    @IBAction func LinkSwitch(sender:AnyObject) {
        
        var url = URL(string: "Your site URL")
        url = linkSwitch.urlChanger(url)
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url!)
        } else {
            UIApplication.shared.openURL(url!)
        }
    }
}
