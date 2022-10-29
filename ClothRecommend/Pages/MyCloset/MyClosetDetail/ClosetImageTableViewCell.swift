//
//  ClosetImageTableViewCell.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/04.
//

import UIKit


class ClosetImageTableViewCell: UITableViewCell {
    
    static let identifier = "ClosetImageTableViewCell"
    
    let imagesCollection: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
    
        let collectionView = UICollectionView(
            frame: CGRect.zero,
            collectionViewLayout: layout
        )
        collectionView.tag = 2
        collectionView.register(
            MyClosetDetailCell.self ,
            forCellWithReuseIdentifier: MyClosetDetailCell.identifier
         )
        
        collectionView.isPagingEnabled = true
    
        return collectionView
    }()
    
    let imageControl = UIPageControl()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUp() {
        contentView.addSubview(imagesCollection)
        contentView.addSubview(imageControl)
        imageControl.currentPageIndicatorTintColor = .systemGray
        imageControl.pageIndicatorTintColor = .systemGray3
    }
    
    private func setUpConstraints() {
        imagesCollection.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-25)
        }
        
        imageControl.snp.makeConstraints {
            $0.top.equalTo(imagesCollection.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
