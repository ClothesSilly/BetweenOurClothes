//
//  RecommendCollectionHeader.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit
import SnapKit


class RecommendCollectionHeader: UICollectionReusableView {
    
     static let identifier = "RecommendCollectionHeader"
    
    let categoryStack = UIStackView()
    let categoryHat = UIButton()
    let categoryTop = UIButton()
    let categoryPants = UIButton()
    let categoryShoes = UIButton()
    let categoryBags = UIButton()
    
    
    let recommendText = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        setUpConstraints()
    }
    
    
    private func setUp() {
        self.addSubview(categoryStack)
        self.addSubview(recommendText)
        setUpStack()
        
        recommendText.text = "당신을 위한 추천 아이템"
    }
    
    private func setUpConstraints() {
        
        categoryStack.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(40)
        }
        
        recommendText.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(20)
        }
    }
    
    
    // hegiht 80
    private func setUpStack() {
        categoryStack.addArrangedSubview(categoryTop)
        categoryStack.addArrangedSubview(categoryHat)
        categoryStack.addArrangedSubview(categoryPants)
        categoryStack.addArrangedSubview(categoryBags)
        categoryStack.addArrangedSubview(categoryShoes)
        
        categoryTop.backgroundColor = .white
        categoryPants.backgroundColor = .green
        categoryShoes.backgroundColor = .black
        categoryHat.backgroundColor = .blue
        categoryBags.backgroundColor = .brown
        
        
        categoryStack.axis = .horizontal
        categoryStack.spacing = 10
        categoryStack.distribution = .fillEqually
    }
    
    
    
}
