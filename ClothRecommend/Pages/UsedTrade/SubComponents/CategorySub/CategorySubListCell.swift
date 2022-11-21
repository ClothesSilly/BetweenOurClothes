//
//  CategorySubListCell.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//

import UIKit
import Foundation
import SnapKit
import Kingfisher

class CategorySubListCell: UICollectionViewCell {
    
    // ------------------------------ UI Components ------------------------------ //
    let csImage = UIImageView()
    let csLabel = UILabel()
    
    // ------------------------------ UI Components ------------------------------ //
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        attribute()
        layout()
    }
    
    private func attribute(){
        csImage.contentMode = .scaleAspectFit
        csImage.layer.cornerRadius = 15.0
        csImage.clipsToBounds = true
        csLabel.layer.cornerRadius = 12.0
        csLabel.clipsToBounds = true
        csLabel.font = .systemFont(ofSize: 14, weight: .bold)
        csLabel.textAlignment = .center
        
        self.backgroundColor = UIColor(red: 206/255.0, green: 166/255.0, blue: 205/255.0, alpha: 1.0)
    }
    private func layout(){
        [csImage, csLabel].forEach{
            contentView.addSubview($0)
        }
        
//        csImage.snp.makeConstraints{
////            $0.top.bottom.equalToSuperview().inset(5)
//            $0.centerY.equalToSuperview()
//            $0.leading.equalToSuperview()
//            $0.height.equalTo(30.0)
//        }
        
        csLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(30.0)
        }
    }
    
    func setData(_ data: CategoryMain ){
        csImage.kf.setImage(with: data.url, placeholder: UIImage(named: "upper"))
        csLabel.text = data.title
        self.layer.cornerRadius = 12.0
        
    }
}
