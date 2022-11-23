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
        thumbnailImageView.backgroundColor = .darkGray
        
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.numberOfLines = 2
        titleLabel.backgroundColor = .green
        
        
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
            $0.top.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
            $0.width.height.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(6)
        }
        
        statusLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(6)
        }
        
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.equalTo(statusLabel.snp.trailing).offset(6)
        }
        
        transportLabel.snp.makeConstraints{
            $0.top.equalTo(statusLabel.snp.bottom).offset(6)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(6)
        }
        
        datetimeLabel.snp.makeConstraints{
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(20)
        }
    }
    
    func setData(_ data: SearchResultCellData) {
        thumbnailImageView.kf.setImage(with: data.thumbnailImageUrl, placeholder: UIImage(named: "logo"))
        titleLabel.text = data.title
        priceLabel.text = "가격 : " + String(data.price ?? 0)
        contentLabel.text = data.content
        statusLabel.text = data.status
        transportLabel.text = data.transport
        datetimeLabel.text = "2022.11.02"
        
    }
}
