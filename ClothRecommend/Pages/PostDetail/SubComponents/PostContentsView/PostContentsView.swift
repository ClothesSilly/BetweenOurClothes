//
//  PostContentsView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/07.
//

import UIKit

class PostContentsView: UIView {
    
    // ------------------------------ UI Components ------------------------------ //
    
    private let priceLabel = UILabel()
    private let priceTag = UITextField()
    private let commentLabel = UILabel()
    private let commentTextView = UITextView()
    
    //ButtonListView로 여러 옷 정보를 입력할 수 있게 해야함
    
    
    
    // ------------------------------ UI Components ------------------------------ //
    // ------------------------------   Rx Traits   ------------------------------ //
    
    
    
    
    // ------------------------------   Rx Traits   ------------------------------ //
    
    
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
        self.backgroundColor = .orange
        
        priceLabel.text = "가격:   ₩"
    
        
        priceTag.text = "100,000원"
        
        commentLabel.text = "상세 설명"
        
        commentTextView.backgroundColor = .white
        commentTextView.text = "임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용"
    }
    
    private func layout(){
        [priceLabel, priceTag, commentLabel, commentTextView].forEach{
            addSubview($0)
        }
        
        
        priceLabel.snp.makeConstraints{
            $0.leading.top.equalToSuperview().inset(10)
        }
        
        
        priceTag.snp.makeConstraints{
            $0.centerY.equalTo(priceLabel.snp.centerY)
            $0.leading.equalTo(priceLabel.snp.trailing).offset(4)
        }
        
        commentLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(10)
            $0.top.equalTo(priceTag.snp.bottom).offset(20)
            
        }
        
        commentTextView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(10)
            $0.top.equalTo(commentLabel.snp.bottom).offset(10)
            $0.height.equalTo(100)
        }
    }
}
