//
//  UsedImageCell.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit
import SnapKit

class UsedImageCell: UICollectionViewCell {
    
    static let identifier = "UsedImageCell"
    
    
    let clothImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(clothImageView)
        
        clothImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(clothImageView)
        
        clothImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
