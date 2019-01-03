//
//  StudentViewController.swift
//  DataDemo
//
//  Created by 贾大伟 on 2019/1/3.
//  Copyright © 2019 david. All rights reserved.
//

import UIKit
import DJExtension
import ObjectMapper

class StudentViewController: UIViewController {
    
    lazy var dataArray: [Student] = {
        return []
    }()
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView(delegate: self, dataSource: self, superView: view, closure: { (make) in
            make.edges.equalTo(view)
        })
        tableView.rowHeight = 50
        tableView.backgroundColor = djWhite
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    private func setNavBar() {
        
        view.backgroundColor = djWhite
        navigationItem.title = "人员列表"
    }
}

extension StudentViewController {
    
    private func addViews() {
        
        
    }
}

extension StudentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = StudentCell.cell(tableView: tableView, indexPath: indexPath)
        cell.student = dataArray[indexPath.row]

        return cell
    }
}

extension StudentViewController {
    
    private func loadData() {
        
        for i in 0..<20 {
            
            var model = Student()
            model.name = "张三\(i)"
            model.phone = "15988889999"
            model.address = "北京市望京绿地中心"
            
            dataArray.append(model)
        }
        
        self.tableView.reloadData()
    }
}
