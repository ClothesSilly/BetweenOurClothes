//
//  CategoryListCollectionViewCell.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/23.
//
import UIKit
import RxSwift
import RxCocoa

class CategoryListCollectionViewCell: UICollectionViewCell {
    
    // ------------------------------ UI Components ------------------------------ //
    
    let categoryButton = UIButton()
    // ------------------------------ UI Components ------------------------------ //
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        attribute()
        layout()
    }
    
    
    private func attribute(){
        categoryButton.setTitle("무료나눔 ", for: .normal)
        categoryButton.setTitleColor(.orange, for: .normal)
        categoryButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        categoryButton.titleLabel?.font = .systemFont(ofSize: 18)
        categoryButton.tintColor = .orange
        categoryButton.backgroundColor = .white
        categoryButton.layer.borderColor = UIColor.orange.cgColor
        categoryButton.layer.borderWidth = 1.0
        categoryButton.layer.cornerRadius = 10.0
        categoryButton.clipsToBounds = true
//        categoryButton.isHidden = true
        categoryButton.semanticContentAttribute = .forceRightToLeft
    }
    
    private func layout(){
        [categoryButton].forEach {
            contentView.addSubview($0)
        }
        //이미지가 배너를 꽉 채워 구성함
        categoryButton.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setData(_ data: BannerListViewCellData) {
    }
}
