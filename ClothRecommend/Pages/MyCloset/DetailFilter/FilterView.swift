//
//  FilterView.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/13.
//

import UIKit

class DetailFilterView: UIView {
    
    
    let filterCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
    
        let collectionView = UICollectionView(
            frame: CGRect.zero,
            collectionViewLayout: layout
        )
        collectionView.tag = 3
        collectionView.register(
            DetailFilterCollectionViewCell.self ,
            forCellWithReuseIdentifier: DetailFilterCollectionViewCell.identeifer
         )
        
        collectionView.register(FilterHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FilterHeader.identifier)
    
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUp() {
        addSubview(filterCollectionView)
        backgroundColor = .white
    }
    
    private func setUpConstraints() {
        filterCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
