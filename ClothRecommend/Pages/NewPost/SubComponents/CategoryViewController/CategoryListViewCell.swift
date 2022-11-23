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
import RxCocoa
import RxSwift


class CategoryListViewCell: UITableViewCell {
    let categoryDict: [Int:[String]] = [1:["브랜드","보세"], 2: ["남자","여자","ㅏ"], 3: ["상의", "하의"], 4:["브랜드","보세"], 5: ["남자","여자"], 6: ["상의", "하의"],7:["브랜드","보세"], 8: ["남자","여자"], 9: ["상의", "하의"],10:["브랜드","보세"], 11: ["남자","여자"], 12: ["상의", "하의"],13:["브랜드","보세"], 14: ["남자","여자"], 15: ["상의", "하의"]]
    let disposeBag = DisposeBag()
    

    // ------------------------------ UI Components ------------------------------ //
   
    let categoryTitleLabel = UILabel()
    
    let borderView = UIView()
    let categoryNum = PublishRelay<Int>()
    
    private lazy var cellButtonLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0

        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWidth / 3 , height: 76)
        return layout
    }()
    private lazy var categoryView = CategoryListCollectionView(frame: .zero, collectionViewLayout: cellButtonLayout)
    
    
    
    
    // 배너
   
//
//    private lazy var bannerListView = BannerListView(frame: .zero, collectionViewLayout: bvLayout)
    
    // ------------------------------ UI Components ------------------------------ //

    
    override func layoutSubviews() {
        super.layoutSubviews()
        bind()
        attribute()
        layout()
    }
    
    func bind(){
        
            
           
    }
    
    private func attribute(){
        
//        bannerListView.backgroundColor = .orange
        
        self.backgroundColor = .systemBackground
      
        categoryTitleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        
        borderView.backgroundColor = .darkGray
        
        categoryView.backgroundColor = .systemBackground
        
//        categoryTitleButton.layer.cornerRadius = 25.0
//        categoryTitleButton.clipsToBounds = true
//        categoryTitleButton.backgroundColor = UIColor(displayP3Red: 216.0, green: 106.0, blue: 142.0, alpha: 1.0)
//        categoryTitleButton.titleLabel?.textColor = .black
//        categoryTitleButton.titleLabel?.textAlignment = .left
        
    }
    private func layout(){
        [categoryTitleLabel, borderView, categoryView].forEach{
            contentView.addSubview($0)
        }
        
        categoryTitleLabel.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        borderView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(categoryTitleLabel.snp.bottom)
            $0.height.equalTo(2.0)
        }
        
        categoryView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(borderView.snp.bottom)
            $0.height.equalTo(48.0)
        }
        
        
        
//        bannerListView.snp.makeConstraints{
//            $0.leading.trailing.equalToSuperview()
//            $0.top.equalTo(categoryTitleButton.snp.bottom).offset(5.0)
//            $0.height.equalTo(100.0)
//
//        }
    }
    
    func setData(_ id: Int, _ title: String ){
        self.categoryTitleLabel.text = title
    }
}
