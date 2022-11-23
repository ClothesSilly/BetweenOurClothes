//
//  CategoryListCollectionView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/23.
//

import UIKit
import RxSwift
import RxCocoa


final class CategoryListCollectionView: UICollectionView {
    let disposeBag = DisposeBag()
    
    // ------------------------------ Rx Traits ------------------------------ //
    
    //TODO: 데이터는 받아와서 뿌리는 것으로 바꿔야함
    //최상위 ViewController에서 배너 이미지를 받아와 이곳에 bind해줄 것이다.
    //let cellData = PublishSubject<[BannerTableViewCellData]>()
    let cellData = Observable.of([
        BannerListViewCellData(bannerImageUrl: nil),
        BannerListViewCellData(bannerImageUrl: nil),
        BannerListViewCellData(bannerImageUrl: nil),
        BannerListViewCellData(bannerImageUrl: nil),
        BannerListViewCellData(bannerImageUrl: nil)
    ])
    // ------------------------------ Rx Traits ------------------------------ //
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
     
        self.register(CategoryListCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryListCollectionViewCell")
        self.isPagingEnabled = true
        self.showsHorizontalScrollIndicator = true
   
        bind()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind(){
        
        cellData
            .bind(to: self.rx.items(
                
                cellIdentifier: "CategoryListCollectionViewCell",
                cellType: CategoryListCollectionViewCell.self
                )
            ){ index, data, cell in
                
            }.disposed(by:disposeBag)
        
    }
    
    private func attribute(){
        self.backgroundColor = .cyan
    
        //self.scroll
    }
}