//
//  PostImageCollectionViewCell.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/17.
//

import Foundation
import UIKit
import Kingfisher


class PostImageCollectionViewCell: UICollectionViewCell {
    
    // ------------------------------ UI Components ------------------------------ //
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "upper")
        return imageView
    }()
    
    // ------------------------------ UI Components ------------------------------ //
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        attribute()
        layout()
    }
    
    private func attribute(){
        
    }
    
    private func layout(){
    
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
    }
}
