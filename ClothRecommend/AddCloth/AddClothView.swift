//
//  AddClothView.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/16.
//

import UIKit

class AddClothView: UIView {
    
    let selectedImageCollectionView: UICollectionView = {
        
        let collectionViewLayer = UICollectionViewFlowLayout()
        collectionViewLayer.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        collectionViewLayer.scrollDirection = .horizontal
        let collectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: 0, height: 0),
            collectionViewLayout: collectionViewLayer
        )
        
        collectionView.register(
            CategoryCollectionViewCell.self ,
            forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier
         )
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    let selectPhoto = UIButton()
    let sumbitButton = UIButton()
    
    
    private func setUp() {
        addSubview(selectPhoto)
        addSubview(selectedImageCollectionView)
        addSubview(sumbitButton)
        selectPhoto.setTitle("사진 고르기", for: .normal)
        selectPhoto.backgroundColor = .gray
        
        sumbitButton.setTitle("저장하기", for: .normal)
        sumbitButton.backgroundColor = .gray
    }
    
    private func setUpConstraints() {
        
        selectPhoto.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        selectedImageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(selectPhoto.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        
        sumbitButton.snp.makeConstraints { make in
            make.top.equalTo(selectedImageCollectionView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
    }
    
}
