//
//  PostTitleView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/07.
//

import UIKit
import SnapKit


class PostTitleView: UIView {
    
    //제목이 여러줄이라도 다 보여줘야하므로
    let titleView = UITextView()
    // 글 수정, 삭제 ( 자기가 쓴 글일 떄만)
    let editButton = UIButton()
    // collectionView 형태로 보이도록 ( 한 줄에 3개 )
   
    let bottomBorder = UIView()
    var title: String?
    
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
        editButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
      
        bottomBorder.backgroundColor = .lightGray
    }
    
    private func layout(){
        [titleView, editButton, bottomBorder]
            .forEach{
                addSubview($0)
            }
        
        titleView.snp.makeConstraints{
            $0.top.leading.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(-40)
            
        }
        
        editButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
            $0.width.height.equalTo(28)
        }
        
        bottomBorder.snp.makeConstraints{
            $0.top.equalTo(titleView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
    func setTitle(_ title: String){
        self.title = title
    }
}

