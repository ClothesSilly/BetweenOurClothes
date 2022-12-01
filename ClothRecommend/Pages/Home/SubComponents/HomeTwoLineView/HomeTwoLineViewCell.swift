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
    //좋아요 수, 댓글 수, 이미지, title 총 4가지 데이터를 포함함
    // ------------------------------ UI Components ------------------------------ //
    
    let imageView = UIImageView()
   
    let titleLabel = UILabel()
    
    let likeCountLabel = UIButton()
    let commentCountLabel = UIButton()
    
    // ------------------------------ UI Components ------------------------------ //
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        attribute()
        layout()
    }
    
    private func attribute(){
     
        self.layer.borderColor = UIColor(.white).cgColor
        self.layer.borderWidth = 6.0
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10.0
        imageView.clipsToBounds = true
        
        
//        priceLabel.numberOfLines = 1
//        priceLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        titleLabel.numberOfLines = 2
        titleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        titleLabel.textColor = UIColor(red: 216.0/255.0, green: 106.0/255.0, blue: 142.0/255.0, alpha: 1.0)
        
        likeCountLabel.setTitle("7", for: .normal)
        likeCountLabel.setTitleColor(.orange, for: .normal)
        likeCountLabel.setImage(UIImage(systemName: "heart"), for: .normal)
        likeCountLabel.titleLabel?.font = .systemFont(ofSize: 18)
        likeCountLabel.tintColor = UIColor(red: 216/255.0, green: 156/255.0, blue: 192/255.0, alpha: 1.0)
        likeCountLabel.backgroundColor = .white
        likeCountLabel.semanticContentAttribute = .forceLeftToRight
        likeCountLabel.clipsToBounds = true
        
        commentCountLabel.setTitle("3", for: .normal)
        commentCountLabel.setTitleColor(.orange, for: .normal)
        commentCountLabel.setImage(UIImage(systemName: "message"), for: .normal)
        commentCountLabel.titleLabel?.font = .systemFont(ofSize: 18)
        commentCountLabel.tintColor = UIColor(red: 216/255.0, green: 156/255.0, blue: 192/255.0, alpha: 1.0)
        commentCountLabel.backgroundColor = .white
        commentCountLabel.semanticContentAttribute = .forceLeftToRight
        commentCountLabel.clipsToBounds = true
        
//        methodLabel.contentMode = .scaleAspectFill
//        methodLabel.layer.cornerRadius = 10.0
//        methodLabel.clipsToBounds = true
        
        
        imageView.kf.setImage(with: URL(string: "...") , placeholder: UIImage(named:"logo"))
//        priceLabel.text = "500만원"
        titleLabel.text = "발렌시아가 18 C컬 패딩 블랙 라지사이즈 거의 새 것"
//        methodLabel.kf.setImage(with: URL(string: "...") , placeholder: UIImage(systemName: "photo"))
        
    }
    
    private func layout(){
        [imageView,  titleLabel, likeCountLabel, commentCountLabel].forEach{
            contentView.addSubview($0)
        }
        
        imageView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview().inset(6)
            $0.bottom.equalToSuperview().inset(68)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(6)
        }
        
        likeCountLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(6)
        }
        commentCountLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(likeCountLabel.snp.trailing).offset(4)
        }
        
//        methodLabel.snp.makeConstraints{
//            $0.leading.bottom.equalTo(imageView).inset(4)
//            $0.width.equalTo(60)
//        }
        
    }
}
