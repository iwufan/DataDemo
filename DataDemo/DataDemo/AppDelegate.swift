//
//  AppDelegate.swift
//  DataDemo
//
//  Created by 贾大伟 on 2019/1/3.
//  Copyright © 2019 david. All rights reserved.
//

import UIKit
import SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let nav = UINavigationController(rootViewController: HomeViewController())
        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        setupSVProgressHUD()
        
        return true
    }

    /// 设置提示样式
    func setupSVProgressHUD() {
        
        SVProgressHUD.setBackgroundColor(UIColor.black.withAlphaComponent(0.8))
        SVProgressHUD.setForegroundColor(.white)
    }

}

