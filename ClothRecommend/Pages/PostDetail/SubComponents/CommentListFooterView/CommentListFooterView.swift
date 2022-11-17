//
//  CommentListFooterView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/17.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa


class CommentListFooterView: UIView {
    
    let newCommentButton = UIButton()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bind()
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func bind(){
        
    }
    private func attribute(){
        
        
        newCommentButton.setTitle("댓글 작성", for: .normal)
        newCommentButton.setTitleColor(.orange, for: .normal)
        newCommentButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        newCommentButton.titleLabel?.font = .systemFont(ofSize: 18)
        newCommentButton.tintColor = .orange
        newCommentButton.backgroundColor = .white
        newCommentButton.layer.borderColor = UIColor.orange.cgColor
        newCommentButton.layer.borderWidth = 1.0
        newCommentButton.layer.cornerRadius = 10.0
        newCommentButton.clipsToBounds = true
        newCommentButton.semanticContentAttribute = .forceRightToLeft
        
        newCommentButton.addTarget(self, action: #selector(addNewComment), for: .touchUpInside)

        
    }
    private func layout(){
       
        self.addSubview(newCommentButton)
        
        newCommentButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(30)
            $0.width.equalTo(200)
        }
        
    }
    
    @objc func addNewComment(){
        print("댓글 작성 버튼 클릭")
    }
    
}


