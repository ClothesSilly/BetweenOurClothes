//
//  SearchResultTableViewCell.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/30.
//

import UIKit
import SnapKit
import Kingfisher

class BlogListCell: UITableViewCell {
    
    let thumbnailImageView = UIImageView()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let statusLabel = UILabel()
    let dateLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        attribute()
        layout()
        
    }
    
    private func attribute(){
        thumbnailImageView.contentMode = .scaleAspectFit
        
        titleLabel.font = .systemFont(ofSize: 18, weight: .heavy)
        titleLabel.numberOfLines = 1
        
        statusLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        
        priceLabel.font = .systemFont(ofSize: 14, weight: .medium)
        
        dateLabel.font = .systemFont(ofSize: 10, weight: .light)
    }
    private func layout(){
        [thumbnailImageView, titleLabel, priceLabel, statusLabel, dateLabel].forEach {
            contentView.addSubview($0)
        }
        
        thumbnailImageView.snp.makeConstraints{
            $0.top.leading.equalToSuperview().inset(8)
            //$0.trailing.lessThan
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(4)
        }
        statusLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(4)
        }
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(statusLabel.snp.trailing).offset(4)
        }
        dateLabel.snp.makeConstraints{
            $0.top.equalTo(statusLabel.snp.bottom).offset(4)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(4)
        }
    }
    //외부에서 데이터 전달, 적용
    func setData(_ data: SearchResultCellData) {
        //없다면 기본 이미지로 표현
        thumbnailImageView.kf.setImage(with: data.thumbnailImageUrl, placeholder: UIImage(systemName: "photo"))
        titleLabel.text = data.title
        statusLabel.text = data.status
        priceLabel.text = String(data.price ?? 0)
        
        var datetime: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.mm.dd"
            let contentDate = data.datetime ?? Date()
            return dateFormatter.string(from: contentDate)
        }
        
        dateLabel.text = datetime
        
    }
}
