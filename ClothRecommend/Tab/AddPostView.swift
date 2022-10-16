//
//  AddPostView.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/16.
//

import UIKit

class AddPostView: UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.register(AddPostCell.self, forCellReuseIdentifier: AddPostCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
