//
//  AddPostCell.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/16.
//

import UIKit

class AddPostCell: UITableViewCell {
    static let identifier = "AddPostCell"
    
    
    let title = UILabel()
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(title)
        title.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(6)
            make.trailing.equalToSuperview().offset(-6)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
