//
//  MessageCell.swift
//  FadeMessage
//
//  Created by saitjr on 8/7/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
}

extension MessageCell {
    private func setupUI() {
        backgroundColor = .clearColor()
        selectionStyle = .None
        
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 5, width: 300, height: 40)
        label.text = "  这是一条测试消息"
        label.textColor = .whiteColor()
        label.backgroundColor = .orangeColor()
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        contentView.addSubview(label)
        
    }
}