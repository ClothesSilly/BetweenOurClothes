//
//  PostWriterView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/23.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift


class PostWriterView: UIView {
    let disposeBag = DisposeBag()
    
    // ------------------------------ UI Components ------------------------------ //
    
    let profileImage = UIImageView()
    let writerNickname = UILabel()
    let postNum = UILabel()
    let followerNum = UILabel()
    let followButton = UIButton()
    
    
    // ------------------------------ UI Components ------------------------------ //
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bind()
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind(){
        
    }
    
    private func attribute(){
        self.backgroundColor = .systemBackground
        
        profileImage.image = UIImage(named: "logo")
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 25.0
        
        writerNickname.font = .systemFont(ofSize: 18, weight: .semibold)
        writerNickname.text = "유저닉네임1"
        postNum.font = .systemFont(ofSize: 12, weight: .regular)
        postNum.text = "게시글 수: 3"
        followerNum.font = .systemFont(ofSize: 12, weight: .regular)
        followerNum.text = "팔로워 수: 10"
        postNum.textColor = .lightGray
        followerNum.textColor = .lightGray
        
        followButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        followButton.setTitle("팔로우", for: .normal)
        followButton.titleLabel?.textColor = UIColor(red: 216/255.0, green: 156/255.0, blue: 192/255.0, alpha: 1.0)
        followButton.tintColor = UIColor(red: 216/255.0, green: 156/255.0, blue: 192/255.0, alpha: 1.0)
        followButton.backgroundColor = .white
        followButton.layer.borderColor = UIColor(red: 196/255.0, green: 146/255.0, blue: 102/255.0, alpha: 1.0).cgColor
        followButton.layer.borderWidth = 1.0
        followButton.layer.cornerRadius = 15.0
        followButton.clipsToBounds = true
        
        followButton.addTarget(self, action: #selector(follow), for: .touchUpInside)
    }
    @objc func follow(){
        print("버튼클릭")
    }
    private func layout(){
        [profileImage, writerNickname, postNum, followerNum, followButton].forEach{
            addSubview($0)
        }
        
        profileImage.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
            $0.width.height.equalTo(50)
        }
        
        writerNickname.snp.makeConstraints{
            $0.leading.equalTo(profileImage.snp.trailing).offset(16)
            $0.top.equalToSuperview().inset(18)
        }
        
        postNum.snp.makeConstraints{
            $0.leading.equalTo(profileImage.snp.trailing).offset(16)
            $0.top.equalTo(writerNickname.snp.bottom).offset(8)
        }
        
        followerNum.snp.makeConstraints{
            $0.leading.equalTo(postNum.snp.trailing).offset(10)
            $0.top.equalTo(writerNickname.snp.bottom).offset(8)
        }
        
        followButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
        
    }
}
