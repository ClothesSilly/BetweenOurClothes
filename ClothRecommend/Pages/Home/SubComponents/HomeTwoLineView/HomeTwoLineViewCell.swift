//
//  HomeTwoLineViewCell.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/16.
//

import Foundation
import UIKit
import Kingfisher
import RxSwift
import RxCocoa

class HomeTwoLineViewCell: UICollectionViewCell {
    //좋아요 수, 댓글 수, 이미지, title 총 4가지 데이터를 포함함
    // ------------------------------ UI Components ------------------------------ //
    
    let imageView = UIImageView()
   
    let titleLabel = UILabel()
    
    let likeCountLabel = UIButton()
    let commentCountLabel = UIButton()
    
    // ------------------------------ UI Components ------------------------------ //
    
    let cellData = PublishRelay<[BannerCellData]>()
    
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
        
        
        likeCountLabel.setTitleColor(.orange, for: .normal)
        likeCountLabel.setImage(UIImage(systemName: "heart"), for: .normal)
        likeCountLabel.titleLabel?.font = .systemFont(ofSize: 18)
        likeCountLabel.tintColor = UIColor(red: 216/255.0, green: 156/255.0, blue: 192/255.0, alpha: 1.0)
        likeCountLabel.backgroundColor = .white
        likeCountLabel.semanticContentAttribute = .forceLeftToRight
        likeCountLabel.clipsToBounds = true
        
        
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
        
        
        
//        priceLabel.text = "500만원"
       
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
    }
    
    func setData(_ data: HomePreviewCellData){
        imageView.kf.setImage(with: URL(string: data.image ?? "") , placeholder: UIImage(named:"logo"))
        titleLabel.text = data.title
        likeCountLabel.setTitle(String(data.likeCount ?? 0), for: .normal)
        commentCountLabel.setTitle(String(data.commentsCount ?? 0), for: .normal)
    }
}
