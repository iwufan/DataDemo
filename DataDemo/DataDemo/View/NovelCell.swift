//
//  NovelCell.swift
//  DataDemo
//
//  Created by 贾大伟 on 2019/1/4.
//  Copyright © 2019 david. All rights reserved.
//

import UIKit
import DJExtension
import Kingfisher

class NovelCell: UITableViewCell {
    
    private var originalView: UIView!   // 容器
    private var coverView: UIImageView!     // 封面
    private var nameLabel: UILabel!
    private var authorLabel: UILabel!
    private var briefLabel: UILabel!
    
    var novel: Novel! {
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
    
    class func cell(tableView: UITableView, indexPath: IndexPath) -> NovelCell {
        
        let cellID = "NovelCellID"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? NovelCell
        
        if cell == nil {
            cell = NovelCell(style: .default, reuseIdentifier: cellID)
        }
        
        return cell!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NovelCell {
    
    private func setAllValues() {
        
        if let path = novel.coverURL, let imageURL = URL(string: path) {
            coverView.kf.setImage(with: imageURL)
        }
        
        nameLabel.text = novel.name
        authorLabel.text = "作者：\(novel.authorName ?? "")"
        briefLabel.text = "简介：\(novel.brief ?? "")"
    }
}

extension NovelCell {
    
    private func addViews() {
        
        originalView = UIView(backgroundColor: djWhite, superView: contentView, closure: { (make) in
            make.edges.equalTo(contentView)
        })
        
        originalView.dj_addBottomLine()
        
        coverView = UIImageView(superView: originalView, closure: { (make) in
            make.left.equalTo(originalView.snp.left).offset(10)
            make.top.equalTo(originalView.snp.top).offset(10)
            make.width.height.equalTo(80)
        })
        coverView.contentMode = .scaleAspectFit
        
        nameLabel = UILabel(text: "", font: dj_systemfont(15), color: djDarkGray, superView: originalView) { (make) in
            make.left.equalTo(coverView.snp.right).offset(10)
            make.top.equalTo(coverView.snp.top)
            make.right.equalTo(originalView.snp.right).offset(-10)
            make.height.equalTo(15)
        }
        
        authorLabel = UILabel(text: "", font: dj_systemfont(11), color: djDarkGray, superView: originalView) { (make) in
            make.left.right.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.height.equalTo(11)
        }
        
        briefLabel = UILabel(text: "", font: dj_systemfont(11), color: djDarkGray, lineCount: 2, superView: originalView) { (make) in
            make.left.equalTo(authorLabel.snp.left)
            make.top.equalTo(authorLabel.snp.bottom).offset(8)
            make.right.equalTo(originalView.snp.right).offset(-10)
        }
        briefLabel.sizeToFit()
    }
}
