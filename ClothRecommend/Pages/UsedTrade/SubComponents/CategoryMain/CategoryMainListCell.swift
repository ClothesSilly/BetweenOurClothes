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
        attribute()
        layout()
    }
    
    private func attribute(){
        self.backgroundColor = UIColor(red: 253/255.0, green: 242/255.0, blue: 180/255.0, alpha: 1.0)
        self.layer.cornerRadius = 20.0
        
        cmImage.contentMode = .scaleAspectFit
        cmImage.layer.cornerRadius = 30.0
        cmImage.clipsToBounds = true
        
        cmLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        cmLabel.textAlignment = .center
    }
    private func layout(){
        [cmImage, cmLabel].forEach{
            contentView.addSubview($0)
        }
        
        cmImage.snp.makeConstraints{
            $0.top.equalToSuperview().inset(8)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(60.0)
        }
        
        cmLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(cmImage.snp.bottom).offset(6.0)
            $0.height.equalTo(10.0)
           
        }
    }
    
    func setData(_ data: CategoryMain ){
        cmImage.kf.setImage(with: data.url, placeholder: UIImage(named: "logo"))
        cmLabel.text = data.title
        
    }
}
