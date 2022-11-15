//
//  CategoryListViewCell.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/15.
//

import UIKit
import Foundation
import SnapKit
import Kingfisher

class CategoryListViewCell: UITableViewCell {
    
    // ------------------------------ UI Components ------------------------------ //
    let categoryTitleButton = UIButton()
    
    // 배너
    private lazy var bvLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWidth , height: 76)
        return layout
    }()
    
    private lazy var bannerListView = BannerListView(frame: .zero, collectionViewLayout: bvLayout)
    
    // ------------------------------ UI Components ------------------------------ //

    override func layoutSubviews() {
        super.layoutSubviews()
        attribute()
        layout()
    }
    
    private func attribute(){
        
        bannerListView.backgroundColor = .orange
        
        
        categoryTitleButton.titleLabel?.text = "카테고리"
        categoryTitleButton.layer.cornerRadius = 25.0
        categoryTitleButton.clipsToBounds = true
        categoryTitleButton.backgroundColor = UIColor(displayP3Red: 216.0, green: 106.0, blue: 142.0, alpha: 1.0)
        categoryTitleButton.titleLabel?.textColor = .black
        categoryTitleButton.titleLabel?.textAlignment = .left
        
    }
    private func layout(){
        [categoryTitleButton, bannerListView].forEach{
            contentView.addSubview($0)
        }
        
        categoryTitleButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(10)
           
            $0.height.width.equalTo(50.0)
        }
        
        bannerListView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(categoryTitleButton.snp.bottom).offset(5.0)
            $0.height.equalTo(100.0)
           
        }
    }
    
    func setData(_ title: String ){
        categoryTitleButton.titleLabel?.text = title
    }
}
