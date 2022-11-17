//
//  HomeSectionTitleView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/16.
//

import UIKit
import RxCocoa
import RxSwift


class HomeSectionTitleView: UIView {
    
    
    let titleLabel = UILabel()
    
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
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .black
        
    }
    
    private func layout(){
        [titleLabel].forEach{
            addSubview($0)
        }
        titleLabel.snp.makeConstraints{
            $0.top.leading.bottom.equalToSuperview().inset(4)
        }
    }
    
}
