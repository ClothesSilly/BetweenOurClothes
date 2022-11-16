//
//  HomeTwoLineViewCell.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/16.
//

import Foundation
import UIKit
import Kingfisher


class HomeTwoLineViewCell: UICollectionViewCell {
    
    // ------------------------------ UI Components ------------------------------ //
    
    let imageView = UIImageView()
    let priceLabel = UILabel()
    let titleLabel = UILabel()
    let methodLabel = UIImageView()
    
    // ------------------------------ UI Components ------------------------------ //
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        attribute()
        layout()
    }
    
    private func attribute(){
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10.0
        imageView.clipsToBounds = true
        
        
        priceLabel.numberOfLines = 1
        priceLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        titleLabel.numberOfLines = 2
        titleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        
        methodLabel.contentMode = .scaleAspectFill
        methodLabel.layer.cornerRadius = 10.0
        methodLabel.clipsToBounds = true
        
        
        imageView.kf.setImage(with: URL(string: "...") , placeholder: UIImage(named:"upper"))
        priceLabel.text = "500만원"
        titleLabel.text = "발렌시아가 18 C컬 패딩 블랙 라지사이즈 거의 새 것"
        methodLabel.kf.setImage(with: URL(string: "...") , placeholder: UIImage(systemName: "photo"))
        
    }
    
    private func layout(){
        [imageView, priceLabel, titleLabel, methodLabel].forEach{
            contentView.addSubview($0)
        }
        
        imageView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview().inset(4)
            $0.bottom.equalToSuperview().inset(80)
        }
        
        priceLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(4)
            $0.top.equalTo(imageView.snp.bottom).offset(10)
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(4)
            $0.bottom.equalToSuperview().inset(4)
        }
        
//        methodLabel.snp.makeConstraints{
//            $0.leading.bottom.equalTo(imageView).inset(4)
//            $0.width.equalTo(60)
//        }
        
    }
}