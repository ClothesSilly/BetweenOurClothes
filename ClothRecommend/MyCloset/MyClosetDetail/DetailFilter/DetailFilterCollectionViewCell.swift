//
//  DetailFilterCollectionViewCell.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/13.
//

import UIKit

class DetailFilterCollectionViewCell: UICollectionViewCell {
    
    static let identeifer = "DetailFilterCollectionViewCell"
    
    let detailText = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUp() {
        contentView.addSubview(detailText)
    }
    
    private func setUpConstraints() {
        detailText.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
