//
//  UsedDetailView.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit


class UsedDetailView: UIView {
    
    let detailScrollView = UIScrollView()
    
    let titleLabel = UILabel()
    let tagView = UIView()
    
    let imageContainerView = UIView()
    
    
    let imageCollectionView: UICollectionView = {
    
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: 0, height: 0),
            collectionViewLayout: layout
        )
        
        collectionView.register(
            UsedImageCell.self ,
            forCellWithReuseIdentifier: "UsedImageCell"
         )
        
        collectionView.isPagingEnabled = true
    
        return collectionView
    }()
    
    
    let imageControl = UIPageControl()
    
    let descriptionView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
        setUpImageSlider()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp() 
    }
    
    
    private func setUpImageSlider() {
        self.addSubview(imageControl)
        imageContainerView.addSubview(imageCollectionView)
        
        
        imageCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageControl.snp.makeConstraints { make in
            make.top.equalTo(imageContainerView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.height.equalTo(34)

        }
        imageControl.backgroundColor = .red
    }
    
    
    
    
    
    
    private func setUp() {
        backgroundColor = .white
        addSubview(detailScrollView)
        setUpScrollView()
        
        tagView.backgroundColor = .blue
        imageContainerView.backgroundColor = .green
        descriptionView.backgroundColor =  .red
        
    }
    
    func setUpConstraints() {
        detailScrollView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
//        setUpScrollViewConstraints()
    }
    
    
    private func setUpScrollView() {
        detailScrollView.contentSize = CGSize(width: self.frame.width, height: 2000)
        detailScrollView.addSubview(titleLabel)
        detailScrollView.addSubview(tagView)
        detailScrollView.addSubview(imageContainerView)
        detailScrollView.addSubview(descriptionView)
        
        titleLabel.text = "hello world"
    }
    
    func setUpScrollViewConstraints() {
        
//        titleLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(8)
//            make.leading.equalToSuperview().offset(8)
//            make.trailing.equalToSuperview().offset(-8)
//            make.height.equalTo(45)
//        }
        
        titleLabel.frame = CGRect(x: 0, y: 8, width: self.frame.width, height: 45)
        
//        tagView.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(3)
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.height.equalTo(30)
//        }
        
        tagView.frame = CGRect(x: 0, y: 60, width: self.frame.width, height: 45)
        
//        imageView.snp.makeConstraints { make in
//            make.top.equalTo(tagView.snp.bottom).offset(3)
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.height.equalTo(200)
//        }
        
        imageContainerView.frame = CGRect(x: 0, y: 120, width: self.frame.width, height: 300)
        
//        descriptionView.snp.makeConstraints { make in
//            make.top.equalTo(imageView.snp.bottom).offset(3)
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.height.equalTo(200)
//        }
        
        descriptionView.frame = CGRect(x: 0, y: 450, width: self.frame.width, height: 300)
    }
    
    
    
}
