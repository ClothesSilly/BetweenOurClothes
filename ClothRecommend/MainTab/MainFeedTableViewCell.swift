//
//  MainFeedTableViewCell.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/14.
//

import UIKit
import SnapKit

class MainFeedTableViewCell: UITableViewCell {
    
    static let identifier = "MainFeedTableViewCell"
    
    let userImage = UIImageView()
    let userName = UILabel()
    let mainImage = UIImageView()
    

    // buttons below the mainImage
    let likeButton = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        self.addSubview(userImage)
        self.addSubview(userName)
        self.addSubview(mainImage)
        
        self.addSubview(likeButton)
        
        userImage.layer.cornerRadius = 15
        userImage.layer.masksToBounds = true
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        
        
        userImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(safeAreaLayoutGuide).offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        userName.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(5)
            make.height.equalTo(30)
            make.leading.equalTo(userImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
        }
        
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(15)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(mainImage.snp.width)
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(10)
            make.leading.equalTo(safeAreaLayoutGuide).offset(10)
//            make.height.equalTo(40)
            make.width.equalTo(40)

            make.bottom.equalTo(safeAreaLayoutGuide).offset(-10)
        }
    }
}
