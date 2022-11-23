//
//  SelectPostCategoryViewCell.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/23.
//

import Foundation
import UIKit
import SnapKit

class SelectPostCategoryViewCell: UICollectionViewCell{
    // ------------------------------ UI Components ------------------------------ //
    
    let pcButton = UIButton()
    
    // ------------------------------ UI Components ------------------------------ //
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        attribute()
        layout()
    }
    
    private func attribute(){
        //버튼들의 모양이 모두 같으므로 동시에 처리
        //임시 텍스트를 지정해주기 위해 enumerate로 해줌
        
            
//        pcButton.setTitle("무료나눔 ", for: .normal)
        pcButton.setTitleColor(.orange, for: .normal)
//        pcButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        pcButton.titleLabel?.font = .systemFont(ofSize: 18)
        pcButton.tintColor = UIColor(red: 216/255.0, green: 156/255.0, blue: 192/255.0, alpha: 1.0)
        pcButton.backgroundColor = .white
        pcButton.layer.borderColor = UIColor(red: 176/255.0, green: 222/255.0, blue: 212/255.0, alpha: 1.0).cgColor
        pcButton.layer.borderWidth = 1.0
        pcButton.layer.cornerRadius = 10.0
        pcButton.clipsToBounds = true
//            btn.isHidden = true
//        pcButton.semanticContentAttribute = .forceRightToLeft
//            btn.layer.borderColor = CGColor(red: 255.0, green: 155.0, blue: 100.0, alpha: 1.0)
//            btn.layer.cornerRadius = 10.0
//            btn.setTitle("카테" + String(idx + 1), for: .normal)
//            btn.setBackgroundColor(.lightGray, for: .normal)
//            btn.setBackgroundColor(.orange, for: .selected)
//            btn.isEnabled = true
//            btn.clipsToBounds = true
            
        }
//        pcButton.addTarget(self, action: #selector(temp), for: .touchUpInside)
    
    
    private func layout(){
    
        [pcButton].forEach{
            contentView.addSubview($0)
        }
        
        pcButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            //$0.leading.equalToSuperview().inset(14)
//            $0.width.equalTo(50)
            $0.height.equalTo(30)
        }
    }
    
    @objc func temp(){
        print("clicked")
    }
}
