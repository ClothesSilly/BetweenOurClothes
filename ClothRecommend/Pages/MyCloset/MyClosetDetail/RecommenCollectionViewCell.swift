//
//  RecommenCollectionViewCell.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/11.
//

import UIKit

class RecommenCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecommenCollectionViewCell"
    
    let recommendImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUp() {
        contentView.addSubview(recommendImageView)
    }
    
    private func setUpConstraints() {
        recommendImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
}
