//
//  CategoryCollectionViewCell.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/02.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
//    let categotyButton = UIButton()
    let categoryImage = UIImageView()
    
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
        addSubview(categoryImage)
        clipsToBounds = true
    }
    
    private func setUpConstraints() {
        categoryImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
            make.bottom.equalToSuperview().offset(-4)
        }
    }
}
