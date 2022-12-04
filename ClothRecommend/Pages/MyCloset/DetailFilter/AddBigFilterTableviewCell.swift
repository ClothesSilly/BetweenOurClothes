//
//  AddBigFilterTableviewCell.swift
//  ClothRecommend
//
//  Created by USER on 2022/12/04.
//

import UIKit

class AddBigFilterTableviewCell: UITableViewCell {
    
    static let identifier = "AddBigFilterTableviewCell"
    
    let title = UILabel()
    
    
    func setUp() {
        addSubview(title)
        
        title.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUp()
    }
    
    
}
