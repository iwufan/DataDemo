//
//  NovelListViewController.swift
//  DataDemo
//
//  Created by 贾大伟 on 2019/1/4.
//  Copyright © 2019 david. All rights reserved.
//

import UIKit
import DJExtension
import ObjectMapper

class NovelListViewController: UIViewController {
    
    lazy var dataArray: [Novel] = {
        return []
    }()
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView(delegate: self, dataSource: self, superView: view, closure: { (make) in
            make.edges.equalTo(view)
        })
        tableView.rowHeight = 100
        tableView.backgroundColor = djWhite
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBar()
        loadData()
    }
    
    private func setNavBar() {
        
        view.backgroundColor = djWhite
        navigationItem.title = "热门小说"
    }
}

extension NovelListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = NovelCell.cell(tableView: tableView, indexPath: indexPath)
        cell.novel = dataArray[indexPath.row]
        
        return cell
    }
}

extension NovelListViewController {
    
    private func loadData() {
        
        HUD.show()
        
        NovelService.request(.novelList, success: { (res) in
            
            HUD.hide()
            
            self.dataArray = Mapper<Novel>().mapArray(JSONArray: res["data"] as! [[String : Any]])
            self.tableView.reloadData()
        })
    }
}
