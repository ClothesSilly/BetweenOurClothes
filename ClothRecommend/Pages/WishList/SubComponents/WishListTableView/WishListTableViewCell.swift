//
//  WishListTableViewCell.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/01.
//


import UIKit
import Foundation
import SnapKit
import Kingfisher

//CellData는 SearchResultCellData를 그대로 쓰면 된다.
class WishListTableViewCell: UITableViewCell {
    
    // ------------------- UI Components ------------------- //
    
    let thumbnailImageView = UIImageView()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let contentLabel = UILabel()
    let statusLabel = UILabel()
    let transportLabel = UILabel()
    let datetimeLabel = UILabel()
    
    // ------------------- UI Components ------------------- //
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        thumbnailImageView.contentMode = .scaleAspectFit
        
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        priceLabel.font = .systemFont(ofSize: 16, weight: .semibold
        )
        contentLabel.font = .systemFont(ofSize: 14)
        contentLabel.numberOfLines = 2
        
        statusLabel.font = .systemFont(ofSize: 16)
        
        transportLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        datetimeLabel.font = .systemFont(ofSize: 12, weight: .light)
        
        [thumbnailImageView, titleLabel, priceLabel, contentLabel, statusLabel, transportLabel, datetimeLabel].forEach{
            contentView.addSubview($0)
        }
        
        thumbnailImageView.snp.makeConstraints{
            $0.top.leading.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(-10)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(6)
            $0.height.equalTo(80)
        }
    }
    
    func setData(_ data: SearchResultCellData) {
        thumbnailImageView.kf.setImage(with: data.thumbnailImageUrl, placeholder: UIImage(systemName: "photo"))
        titleLabel.text = data.title
        
    }
}
