//
//  HUD.swift
//  DataDemo
//
//  Created by 贾大伟 on 2019/1/4.
//  Copyright © 2019 david. All rights reserved.
//

import Foundation
import SVProgressHUD

/// 对SVProgressHUD的简单封装
public struct HUD {
    /// 显示加载中圆圈
    public static func show() {
        
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(.clear)
    }
    /// 关闭
    public static func hide() {
        
        SVProgressHUD.dismiss()
    }
    /// 成功提示
    public static func showSuccess(_ title: String, delay: TimeInterval = 1) {
        
        SVProgressHUD.showSuccess(withStatus: title)
        SVProgressHUD.dismiss(withDelay: delay)
    }
    /// 失败提示
    public static func showFailure(_ title: String, delay: TimeInterval = 1) {
        
        SVProgressHUD.showError(withStatus: title)
        SVProgressHUD.dismiss(withDelay: delay)
    }
}
