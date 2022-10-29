//
//  UsedImageCell.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit
import SnapKit

class MyClosetDetailCell: UICollectionViewCell {
    
    static let identifier = "UsedImageCell"
    
    let clothImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        setUpConstraints()
    }
    
    private func setUp() {
        contentView.addSubview(clothImageView)
    }
    
    private func setUpConstraints() {
        clothImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
