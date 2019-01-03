//
//  HomeViewController.swift
//  DataDemo
//
//  Created by 贾大伟 on 2019/1/3.
//  Copyright © 2019 david. All rights reserved.
//

import UIKit
import DJExtension
import SnapKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = djWhite
        navigationItem.title = "首页"

        addViews()
    }

}

extension HomeViewController {
    
    private func addViews() {
        
        let loadButton = UIButton(title: "Load Data", titleFont: dj_systemfont(18) , titleColor: djWhite, bgColor: djOrange, target: self, action: #selector(clickLoadData), superView: view) { (make) in
            
            make.center.equalTo(view)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        loadButton.dj_setCornerRadius(radius: 5)
    }

}

extension HomeViewController {
    
    @objc private func clickLoadData() {
        
        dj_push(StudentViewController())
    }
}
