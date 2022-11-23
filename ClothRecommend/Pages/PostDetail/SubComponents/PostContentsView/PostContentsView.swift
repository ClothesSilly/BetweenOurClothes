//
//  PostContentsView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/07.
//

import UIKit

class PostContentsView: UIView {
    
    // ------------------------------ UI Components ------------------------------ //
    
    private let priceTag = UITextField()
    private let onSaleImageView = UIImageView()
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
        self.backgroundColor = .white
        
        priceTag.text = "100,000원"
        priceTag.font = .systemFont(ofSize: 28, weight: .bold)
        
        
        onSaleImageView.image = UIImage(named: "panwan2")
        onSaleImageView.contentMode = .scaleAspectFit
        onSaleImageView.clipsToBounds = true
        
        commentLabel.text = "상세 설명"
        commentLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        
        commentTextView.backgroundColor = .white
        commentTextView.font = .systemFont(ofSize: 14, weight: .regular)
        commentTextView.text = "임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용임시 내용"
    }
    
    private func layout(){
        [ priceTag, onSaleImageView, commentLabel, commentTextView].forEach{
            addSubview($0)
        }
        
        priceTag.snp.makeConstraints{
            $0.leading.top.equalToSuperview().inset(10)
        }
        
        onSaleImageView.snp.makeConstraints{
            $0.leading.equalTo(priceTag.snp.trailing).offset(16)
            $0.centerY.equalTo(priceTag)
            $0.height.equalTo(36)
        }
        
        commentLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(10)
            $0.top.equalTo(priceTag.snp.bottom).offset(20)
            
        }
        
        commentTextView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(commentLabel.snp.bottom)
            $0.height.equalTo(400)
        }
    }
}
