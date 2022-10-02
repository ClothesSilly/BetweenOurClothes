//
//  RecommendCollectionViewCell.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit

class MyClosetCell: UICollectionViewCell {
    
    static let identifier = "MyClosetCell"
    
    let clothImage = UIImageView()
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        setUp()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        setUpConstraints()
    }
    
    
    private func setUp() {
        addSubview(clothImage)
    }
    
    private func setUpConstraints() {
        clothImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
