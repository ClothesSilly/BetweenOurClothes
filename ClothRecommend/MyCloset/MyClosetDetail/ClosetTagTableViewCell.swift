//
//  ClosetTagTableViewCell.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/04.
//

import UIKit

class ClosetTagTableViewCell: UITableViewCell {
    
    static let identifer = "ClosetTagTableViewCell"
    
    let tagCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: 0, height: 0),
            collectionViewLayout: layout
        )
        collectionView.tag = 1
        collectionView.register(
            TagCollectionViewCell.self,
            forCellWithReuseIdentifier: TagCollectionViewCell.identifier
        )
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
        contentView.addSubview(tagCollectionView)
    }
    
    private func setUpConstraints() {
        tagCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
