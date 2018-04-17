//
//  SampleViewController.swift
//  ADLinkSwift
//
//  Created by Matsuki, Reiya (松木 玲也) on 2018/01/04.
//  Copyright © 2018年 ValueCommerce. All rights reserved.
//

import UIKit

class SampleViewController: UITableViewController {

    struct MenuItem {
        var name : String
        var className : String
    }
    
    let menuItems = [
        MenuItem(name: "LSLinkSwitch",               className: "LSLinkSwitchViewController"),
        MenuItem(name: "LinkSwitch_UItextView",      className: "LSUITextViewController"),
        MenuItem(name: "LinkSwitch_UIWebView",       className: "LSUIWebViewController"),
        MenuItem(name: "LinkSwitch_WKWebView",       className: "LSWKWebViewController"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        let menuItem = menuItems[indexPath.row]
        cell.textLabel?.text = menuItem.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        let viewControllerClass = NSClassFromString(NSString(format: "VCSDK_for_media_Example_Swift.%@", menuItem.className) as String) as? UIViewController.Type
        let viewController : UIViewController = viewControllerClass!.init(nibName: menuItem.className, bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


