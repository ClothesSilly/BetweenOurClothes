//
//  PostTitleView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/07.
//

import UIKit
import SnapKit
import Kingfisher

class PostTitleView: UIView {
    
    var title: String?
    
    // ------------------------------ UI Components ------------------------------ //
    
    let postCategoryView = UILabel()
    
    //제목이 여러줄이라도 다 보여줘야하므로
    let titleView = UITextView()
    //프로필 이미지
    let profileImage = UIImageView()
    //닉네임
    let userNickNameLabel = UILabel()
    //글 작성 시각
    let datetimeLabel = UILabel()
    //댓글 수
    let commentsNumLabel = UILabel()
   
    let bottomBorder = UIView()
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
    
    //임시
    private func bind(){
        
    }
    
    private func attribute(){
        
        //TODO: 임시로 텍스트 채워넣어놓음
        
        postCategoryView.text = "니트/가디건 벼룩시장"
        titleView.text = "버버리 니트 2022SS 몇 번 안 입은 신상 판매합니다.버버리 니트 2022SS 몇 번 안 입은 신상 판매합니다."
        profileImage.image = UIImage(named: "logo")
        userNickNameLabel.text = "닉네임입니다"
        datetimeLabel.text = "22.11.07"
        commentsNumLabel.text = "100"
        
        postCategoryView.font = .systemFont(ofSize: 12, weight: .semibold
        )
        postCategoryView.textColor = .red
        postCategoryView.textAlignment = .left
        
        titleView.font = .systemFont(ofSize: 18, weight: .bold)
        titleView.textColor = .black
        titleView.textAlignment = .left
//        titleView.backgroundColor = .blue
        titleView.isScrollEnabled = false
        
        profileImage.layer.cornerRadius = 25.0
        profileImage.contentMode = .scaleAspectFit
        profileImage.clipsToBounds = true
        profileImage.backgroundColor = .white
        
        userNickNameLabel.font = .systemFont(ofSize: 12, weight: .medium)
        userNickNameLabel.textColor = .darkGray
        userNickNameLabel.textAlignment = .center
        
        datetimeLabel.textColor = .darkGray
        datetimeLabel.font = .systemFont(ofSize: 12, weight: .medium)
      
        bottomBorder.backgroundColor = .black
    }
    
    private func layout(){
        [postCategoryView, titleView, profileImage, userNickNameLabel, datetimeLabel, bottomBorder]
            .forEach{
                addSubview($0)
            }
        
        postCategoryView.snp.makeConstraints{
            $0.top.leading.equalToSuperview().inset(10)
        }
        
        titleView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(postCategoryView.snp.bottom).offset(10)
            //$0.height.greaterThanOrEqualTo(20)
        }
        
        profileImage.snp.makeConstraints{
            $0.top.equalTo(titleView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(12)
            $0.width.height.equalTo(50)
        }

        userNickNameLabel.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.top).offset(6)
            $0.leading.equalTo(profileImage.snp.trailing).offset(8)
        }
//
        datetimeLabel.snp.makeConstraints{
            $0.bottom.equalTo(profileImage.snp.bottom).offset(-6)
            $0.leading.equalTo(profileImage.snp.trailing).offset(8)
        }

        bottomBorder.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    func setTitle(_ title: String){
        self.title = title
    }
}

