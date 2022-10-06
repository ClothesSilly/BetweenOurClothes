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
            frame: CGRect(x: 0, y: 0, width: 0, height: 0),
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
    }
    private func setUpConstraints() {
        imagesCollection.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
