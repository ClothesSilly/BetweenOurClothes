//
//  MiddleCategoryCell.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/02.
//

import UIKit

class MiddleCategoryCell: UICollectionViewCell {
    
    static let identifier = "MiddleCategoryCell"
    
    let categoryLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            
        }
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
