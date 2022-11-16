//
//  CommentListTableViewCell.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/16.
//

import UIKit
import Foundation
import SnapKit
import Kingfisher

//CellData는 SearchResultCellData를 그대로 쓰면 된다.
class CommentListTableViewCell: UITableViewCell {
    
    // ------------------- UI Components ------------------- //
    let profileImageLabel = UIImageView() // 프로필 이미지
    
    let nicknameLabel = UILabel() // 닉네임
    let writerLabel = UIImageView()
    
    let datetimeLabel = UILabel() // 시간 혹은 날짜
    let datetimeIcon = UIImageView()
    
    let dotdotdotLabel = UIImageView() // 맨 우측 메뉴? 버튼
    
    let contentTextView = UITextView()
    
    
    // ------------------- UI Components ------------------- //
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bind()
        attribute()
        layout()
        
    }
    
    func bind(){
        
        
        
    }
    
    private func attribute(){
        profileImageLabel.contentMode = .scaleAspectFit
        profileImageLabel.backgroundColor = .darkGray
        profileImageLabel.layer.cornerRadius = 25.0
        profileImageLabel.clipsToBounds
        
        nicknameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        nicknameLabel.numberOfLines = 1
        
        datetimeLabel.font = .systemFont(ofSize: 12, weight: .regular)
        datetimeLabel.numberOfLines = 1
        
        contentTextView.font = .systemFont(ofSize: 18, weight: .bold)
        contentTextView.backgroundColor = .systemYellow
        profileImageLabel.image = UIImage(named: "upper")
        nicknameLabel.text = "닉네임1"
        datetimeLabel.text = "32:51"
        contentTextView.text = "댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다.댓글 내용입니다."
        
        dotdotdotLabel.image = UIImage(systemName: "photo")
        dotdotdotLabel.layer.cornerRadius = 20.0
        dotdotdotLabel.clipsToBounds
        dotdotdotLabel.contentMode = .scaleAspectFit
        dotdotdotLabel.backgroundColor = .systemPink
        
    }
    
    private func layout(){
        [profileImageLabel, nicknameLabel, writerLabel, datetimeLabel, datetimeIcon, dotdotdotLabel, contentTextView].forEach{
            contentView.addSubview($0)
        }
        
        profileImageLabel.snp.makeConstraints{
            $0.top.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(60)
        }
        
        nicknameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalTo(profileImageLabel.snp.trailing).offset(6)
        }
        
//        writerLabel.snp.makeConstraints{
//            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
//            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(6)
//        }
        
        datetimeLabel.snp.makeConstraints{
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileImageLabel.snp.trailing).offset(6)
        }
        
//        datetimeIcon.snp.makeConstraints{
//            $0.top.equalTo(statusLabel.snp.bottom).offset(6)
//            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(6)
//        }
        
        contentTextView.snp.makeConstraints{
            $0.top.equalTo(datetimeLabel.snp.bottom).offset(8)
            $0.leading.equalTo(profileImageLabel.snp.trailing).offset(6)
            $0.trailing.equalToSuperview().inset(56)
            $0.bottom.equalToSuperview().inset(10)
            
        }
        
        dotdotdotLabel.snp.makeConstraints{
            $0.top.trailing.equalToSuperview().inset(16)
            $0.height.width.equalTo(40)
        }
        
      
    }
    
    func setData(_ data: SearchResultCellData) {
        
    }
}
