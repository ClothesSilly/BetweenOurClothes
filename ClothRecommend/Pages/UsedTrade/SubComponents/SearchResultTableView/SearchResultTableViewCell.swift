//
//  SearchResultTableViewCell.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/30.
//

import UIKit
import SnapKit
import Kingfisher

class SearchResultTableViewCell: UITableViewCell {
    
    // ------------------- UI Components ------------------- //
    
    let thumbnailImageView = UIImageView()
    
    let titleLabel = UILabel()
    
    let contentLabel = UILabel()
    
    
    let transportLabel = UIButton()
    let priceTitleLabel = UILabel()
    let priceLabel = UILabel()
    let datetimeLabel = UILabel()
    
    // ------------------- UI Components ------------------- //
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.selectionStyle = .none
        attribute()
        layout()
        
        
    }
    
    private func attribute(){
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.backgroundColor = .systemBackground
        thumbnailImageView.layer.cornerRadius = 8.0
        thumbnailImageView.clipsToBounds = true
        
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.numberOfLines = 2
        
        
        
        priceLabel.font = .systemFont(ofSize: 20, weight: .bold)
        priceTitleLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        priceTitleLabel.textColor = UIColor(red: 226/255.0, green: 126/255.0, blue: 152/255.0, alpha: 1.0)
        priceTitleLabel.text = "PRICE "
        contentLabel.font = .systemFont(ofSize: 14)
        contentLabel.numberOfLines = 2
        
                
//        transportLabel.setTitle("무료나눔 ", for: .normal)
        transportLabel.setTitleColor(.systemOrange, for: .normal)
        
        transportLabel.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        transportLabel.tintColor = UIColor(red: 216/255.0, green: 156/255.0, blue: 192/255.0, alpha: 1.0)
        transportLabel.backgroundColor = .white
        transportLabel.layer.borderColor = UIColor.orange.cgColor
        transportLabel.layer.borderWidth = 2.0
        transportLabel.layer.cornerRadius = 10.0
        transportLabel.clipsToBounds = true
        transportLabel.semanticContentAttribute = .forceRightToLeft

        datetimeLabel.font = .systemFont(ofSize: 12, weight: .light)
    }
    
    private func layout(){
        [thumbnailImageView, contentLabel, titleLabel, priceTitleLabel, priceLabel, transportLabel, datetimeLabel].forEach{
            contentView.addSubview($0)
        }
        
        thumbnailImageView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(8)
            $0.top.bottom.equalToSuperview().inset(12)
            $0.width.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(30)
        }
        
        contentLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(50)
        }
        
        
        transportLabel.snp.makeConstraints{
            $0.bottom.equalTo(thumbnailImageView.snp.bottom)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(12)
            $0.height.equalTo(24)
            $0.width.equalTo(90)
        }
        
        priceTitleLabel.snp.makeConstraints{
            $0.bottom.equalTo(datetimeLabel.snp.top).offset(-6)
            $0.trailing.equalTo(priceLabel.snp.leading).offset(-4)
        }
        
        priceLabel.snp.makeConstraints{
            $0.bottom.equalTo(datetimeLabel.snp.top).offset(-6)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        
        datetimeLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(8)
        }
    }
    
    func setData(_ data: SearchResultCellData) {
        thumbnailImageView.image = UIImage(named: "logo")
        titleLabel.text = data.title
        priceLabel.text = String(data.price ?? "0")
        contentLabel.text = data.content
        if data.transport == "직거래"{
            transportLabel.setImage(UIImage(systemName: "person.3.fill"), for: .normal)
        }
        else{
            transportLabel.setImage(UIImage(systemName: "tray.fill"), for: .normal)
        }
        transportLabel.setTitle( data.transport, for: .normal)
        datetimeLabel.text = "2022.11.02"
        
    }
}
