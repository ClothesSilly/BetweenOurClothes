//
//  RecommendCollectionViewCell.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "recommend cell"
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
