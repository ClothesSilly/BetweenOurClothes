//
//  UsedMarketCollectionView.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit

class MyClosetCollectionView: UIView {
    
    let bigCategoryView = UIView()
    let categoryCollectionView: UICollectionView = {
        
        let collectionViewLayer = UICollectionViewFlowLayout()
        collectionViewLayer.sectionInset = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        collectionViewLayer.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: 0, height: 0),
            collectionViewLayout: collectionViewLayer
        )
        
        collectionView.register(
            CategoryCollectionViewCell.self ,
            forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier
         )
        
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let usedMarketCollectionView: UICollectionView = {
        
        let collectionViewLayer = UICollectionViewFlowLayout()
        collectionViewLayer.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        let collectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: 0, height: 0),
            collectionViewLayout: collectionViewLayer
        )
        
        collectionView.register(
            MyClosetCell.self ,
            forCellWithReuseIdentifier: MyClosetCell.identifier
         )
        
        collectionView.register(
            RecommendCollectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: RecommendCollectionHeader.identifier
        )
        return collectionView
    }()
    
    let collectionViewHeader: UICollectionReusableView = {
        let header2 = UICollectionReusableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        
        return header2
    }()
    
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
    
    
    func setUp() {
        backgroundColor = .white
        categoryCollectionView.tag = 1
        usedMarketCollectionView.tag = 2
        self.addSubview(categoryCollectionView)
        self.addSubview(usedMarketCollectionView)
    }
    
    func setUpConstraints() {
        
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(70)
        }
        
        usedMarketCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        
    }
    
    
    func setUpCollectionView() {
        usedMarketCollectionView.addSubview(collectionViewHeader)
        
        
    }
    
}
