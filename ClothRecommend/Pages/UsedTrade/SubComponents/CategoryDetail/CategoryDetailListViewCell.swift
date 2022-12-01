//
//  CategoryDetailListViewCell.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/12/01.
//

import UIKit
import Foundation
import SnapKit
import Kingfisher

class CategoryDetailListViewCell: UICollectionViewCell {
    
    // ------------------------------ UI Components ------------------------------ //

    let cdLabel = UILabel()
    
    // ------------------------------ UI Components ------------------------------ //
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        attribute()
        layout()
    }
    
    private func attribute(){
        
        cdLabel.layer.cornerRadius = 12.0
        cdLabel.clipsToBounds = true
        cdLabel.font = .systemFont(ofSize: 14, weight: .bold)
        cdLabel.textAlignment = .center
        
        self.backgroundColor = UIColor(red: 206/255.0, green: 166/255.0, blue: 205/255.0, alpha: 1.0)
    }
    private func layout(){
        [cdLabel].forEach{
            contentView.addSubview($0)
        }
        
        cdLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(30.0)
        }
    }
    
    func setData(_ data: String ){
        cdLabel.text = data
        self.layer.cornerRadius = 12.0
        
    }
}

