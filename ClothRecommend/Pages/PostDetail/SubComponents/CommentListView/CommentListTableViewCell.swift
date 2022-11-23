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
    
    let dotdotdotButton = UIButton() // 맨 우측 메뉴? 버튼
    
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
        profileImageLabel.layer.borderColor = UIColor(red: 226/255.0, green: 110/255.0, blue: 132/255.0, alpha: 1.0).cgColor
        profileImageLabel.layer.borderWidth = 2.0
        profileImageLabel.clipsToBounds = true
        
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
        
        dotdotdotButton.setImage( UIImage(systemName: "ellipsis.circle"), for: .normal)
        dotdotdotButton.layer.cornerRadius = 20.0
        dotdotdotButton.tintColor = UIColor(red: 226/255.0, green: 110/255.0, blue: 132/255.0, alpha: 1.0)
        dotdotdotButton.clipsToBounds = true
        dotdotdotButton.contentMode = .scaleToFill
        dotdotdotButton.backgroundColor = .systemBackground
        dotdotdotButton.addTarget(self, action: #selector(dotButtonClicked), for: .touchUpInside)
        
    }
    
    @objc func dotButtonClicked(){
        print("dot button clicked")
    }
    
    private func layout(){
        [profileImageLabel, nicknameLabel, writerLabel, datetimeLabel, datetimeIcon, dotdotdotButton, contentTextView].forEach{
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
        
        dotdotdotButton.snp.makeConstraints{
            $0.top.trailing.equalToSuperview().inset(10)
            $0.height.width.equalTo(40)
        }
        
      
    }
    
    func setData(_ data: SearchResultCellData) {
        
    }
}
