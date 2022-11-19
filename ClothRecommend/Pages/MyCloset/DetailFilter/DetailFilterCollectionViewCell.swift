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
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 241/255, green: 191/255, blue: 220/255, alpha: 1).cgColor
        detailText.textColor = .gray
        
    }
    
    private func setUpConstraints() {
        detailText.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().offset(-4)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
