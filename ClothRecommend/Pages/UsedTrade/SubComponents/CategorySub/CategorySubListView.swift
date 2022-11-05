//
//  CategorySubListView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//

import UIKit
import RxSwift
import RxCocoa


typealias CategorySub = ( url: URL?, title: String)

final class CategorySubListView: UICollectionView {
    let disposeBag = DisposeBag()
    
    
    let cellData = Observable.of([
        CategorySub(nil, "후드티"),
        CategorySub(nil, "맨투맨"),
        CategorySub(nil, "니트"),
        CategorySub(nil, "반팔"),
        CategorySub(nil, "카라티"),
        CategorySub(nil, "아우터")
    ])
    

    override init(frame: CGRect, collectionViewLayout collecViewLayout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collecViewLayout)
        
        self.register(CategorySubListCell.self, forCellWithReuseIdentifier: "CategorySubListCell")
       
        bind()
        attribute()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(){
        cellData
            .bind(to: self.rx.items(
                cellIdentifier: "CategorySubListCell",
                cellType: CategorySubListCell.self
            )
        ){ index, data, cell in
                cell.backgroundColor = .systemPink
               // cell.cmImage = color.
                cell.setData(data)
            }.disposed(by: disposeBag)
        
    }
    private func attribute(){
        self.backgroundColor = .lightGray
    }
}
