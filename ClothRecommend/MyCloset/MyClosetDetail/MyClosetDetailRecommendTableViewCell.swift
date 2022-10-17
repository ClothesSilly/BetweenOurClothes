//
//  MyClosetDetailRecommendTableViewCell.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/11.
//

import UIKit


class MyClosetDetailRecommendTableViewCell: UITableViewCell {
    
    static let identifier = "MyClosetDetailRecommendTableViewCell"
    
    let recommendCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
    
        let collectionView = UICollectionView(
            frame: CGRect.zero,
            collectionViewLayout: layout
        )
        collectionView.tag = 3
        collectionView.register(
            RecommenCollectionViewCell.self ,
            forCellWithReuseIdentifier: RecommenCollectionViewCell.identifier
         )
        
        collectionView.isScrollEnabled = false
        if collectionView.bounds.size != collectionView.intrinsicContentSize {

            collectionView.invalidateIntrinsicContentSize()

        }
    
        return collectionView
    }()
    
    override var intrinsicContentSize: CGSize {
        return recommendCollectionView.contentSize
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func setUp() {
        contentView.addSubview(recommendCollectionView)
    }
    
    private func setUpConstraints() {
        recommendCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
