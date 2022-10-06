//
//  MyClosetTagCollectionViewCell.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/04.
//

import UIKit


class MyClosetTagCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyClosetTagCollectionViewCell"
    
    let tagLabel = UILabel()
    
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
        addSubview(tagLabel)
        tagLabel.textColor = .black
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setUpConstraints() {
        tagLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(4)
            make.top.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(-4)
            make.trailing.equalToSuperview().offset(-4)
        }
    }
    
}
