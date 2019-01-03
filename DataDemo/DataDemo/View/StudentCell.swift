//
//  StudentCell.swift
//  DataDemo
//
//  Created by 贾大伟 on 2019/1/3.
//  Copyright © 2019 david. All rights reserved.
//

import UIKit
import DJExtension

class StudentCell: UITableViewCell {
    
    private var originalView: UIView!   // 容器
    private var nameLabel: UILabel!
    private var phoneLabel: UILabel!
    private var addressLabel: UILabel!
    
    var student: Student! {
        didSet {
            setAllValues()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = djWhite
        selectionStyle = .none
        
        addViews()
    }
    
    class func cell(tableView: UITableView, indexPath: IndexPath) -> StudentCell {
        
        let cellID = "StudentCellID"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? StudentCell
        
        if cell == nil {
            cell = StudentCell(style: .default, reuseIdentifier: cellID)
        }
        
        return cell!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        
        
    }
}

extension StudentCell {
    
    private func setAllValues() {
        
        nameLabel.text = student.name
        phoneLabel.text = student.phone
        addressLabel.text = student.address
    }
}

extension StudentCell {
    
    private func addViews() {
        
        originalView = UIView(backgroundColor: djWhite, superView: contentView, closure: { (make) in
            make.edges.equalTo(contentView)
        })
        // 姓名
        nameLabel = UILabel(text: "", font: dj_systemfont(13), color: djDarkGray, superView: originalView) { (make) in
            make.left.equalTo(originalView.snp.left).offset(10)
            make.top.equalTo(originalView.snp.top).offset(17)
            make.width.equalTo(100)
            make.height.equalTo(13)
        }
        // 手机号
        phoneLabel = UILabel(text: "", font: dj_systemfont(12), color: djDarkGray, alignment: .right, superView: originalView) { (make) in
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.right.equalTo(originalView.snp.right).offset(-10)
            make.width.equalTo(150)
            make.height.equalTo(12)
        }
        // 地址
        addressLabel = UILabel(text: "", font: dj_systemfont(13), color: djDarkGray, superView: originalView) { (make) in
            make.left.equalTo(nameLabel.snp.left)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.right.equalTo(originalView.snp.right).offset(-10)
            make.height.equalTo(13)
        }
    }
}
