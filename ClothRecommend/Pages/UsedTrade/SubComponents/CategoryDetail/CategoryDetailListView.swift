//
//  CategoryDetailListView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/12/01.
//

import UIKit
import RxSwift
import RxCocoa



final class CategoryDetailListView: UICollectionView {
    let disposeBag = DisposeBag()
    let cmChoiceIndex = PublishSubject<Int>()
    
    
    let cellData = Observable.of([
        "1","2","3","4","5","6","7"
    ])
    

    override init(frame: CGRect, collectionViewLayout collecViewLayout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collecViewLayout)
     
        bind()
        attribute()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(){
        cellData
            .bind(to: self.rx.items(
                cellIdentifier: "CategoryDetailListViewCell",
                cellType: CategoryDetailListViewCell.self
            )
        ){ index, data, cell in
                
               // cell.cmImage = color.
                cell.setData(data)
            }.disposed(by: disposeBag)
        
    }
    private func attribute(){
        self.register(CategoryDetailListViewCell.self, forCellWithReuseIdentifier: "CategoryDetailListViewCell")
        self.backgroundColor = .white
    }
}
