//
//  CategoryMainListCell.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//

import UIKit
import Foundation
import SnapKit
import Kingfisher

class CategoryMainListCell: UICollectionViewCell {
    
    // ------------------------------ UI Components ------------------------------ //
    let cmImage = UIImageView()
    let cmLabel = UILabel()
    
    // ------------------------------ UI Components ------------------------------ //
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout()
    }
    
    private func layout(){
        [cmImage, cmLabel].forEach{
            contentView.addSubview($0)
        }
        
        cmImage.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(-30)
        }
        
        cmLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(cmImage.snp.bottom)
        }
    }
    
    func setData(_ data: CategoryMain ){
        cmImage.kf.setImage(with: data.url, placeholder: UIImage(systemName: "photo"))
        cmLabel.text = data.title
        
    }
}
