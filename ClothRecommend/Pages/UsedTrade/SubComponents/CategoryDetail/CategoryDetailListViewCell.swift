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

    let cdLabel = UIButton()
    
    // ------------------------------ UI Components ------------------------------ //
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        attribute()
        layout()
    }
    
    private func attribute(){
        
        cdLabel.layer.cornerRadius = 12.0
//        cdLabel.setTitleColor(.black, for: .normal)
        
//        pcButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        cdLabel.titleLabel?.textColor = .black
        cdLabel.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        cdLabel.titleLabel?.textAlignment = .center
        cdLabel.tintColor = UIColor(red: 216/255.0, green: 156/255.0, blue: 192/255.0, alpha: 1.0)
       
        
        cdLabel.layer.borderColor = UIColor(red: 176/255.0, green: 222/255.0, blue: 212/255.0, alpha: 1.0).cgColor
        cdLabel.layer.borderWidth = 1.0
        cdLabel.layer.cornerRadius = 10.0
        cdLabel.clipsToBounds = true
        cdLabel.setBackgroundColor(UIColor(red: 176/255.0, green: 196/255.0, blue: 132/255.0, alpha: 1.0), for: .normal)
        cdLabel.setBackgroundColor(.red, for: .selected)
        cdLabel.addTarget(self, action: #selector(my), for: .touchUpInside)
        
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
    @objc func my(){
        print("clicked!!!!")
        self.isSelected = !self.isSelected
        print(self.isSelected)
    }
    
    func setData(_ data: String ){
        cdLabel.setTitle(data, for: .normal)
//        self.layer.cornerRadius = 12.0
        
    }
}


