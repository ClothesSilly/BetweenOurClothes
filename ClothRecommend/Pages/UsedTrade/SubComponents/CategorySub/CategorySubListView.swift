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
    let cmChoiceIndex = PublishSubject<Int>()
    
    
    let cellDataUpper = Observable.of([
        CategorySub(nil, "상의1"),
        CategorySub(nil, "상의2"),
        CategorySub(nil, "상의3"),
        CategorySub(nil, "상의4"),
        CategorySub(nil, "상의5"),
        CategorySub(nil, "상의6")
    ])
    
    let cellDataPants = Observable.of([
        CategorySub(nil, "하의1"),
        CategorySub(nil, "하의2"),
        CategorySub(nil, "하의3"),
        CategorySub(nil, "하의4"),
        CategorySub(nil, "하의5"),
        CategorySub(nil, "하의6")
    ])
    
    let cellDataOuter = Observable.of([
        CategorySub(nil, "아우터1"),
        CategorySub(nil, "아우터2"),
        CategorySub(nil, "아우터3"),
        CategorySub(nil, "아우터4"),
        CategorySub(nil, "아우터5"),
        CategorySub(nil, "아우터6")
    ])
    
    let cellDataOnePiece = Observable.of([
        CategorySub(nil, "원피스1"),
        CategorySub(nil, "원피스2"),
        CategorySub(nil, "원피스3"),
        CategorySub(nil, "원피스4"),
        CategorySub(nil, "원피스5"),
        CategorySub(nil, "원피스6")
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
        cmChoiceIndex
            .flatMapLatest{ idx -> Observable<[CategorySub]> in
            switch idx{
            case 0:
                return self.cellDataUpper
            case 1:
                return self.cellDataPants
            case 2:
                return self.cellDataOuter
            default:
                return self.cellDataOnePiece
            }
        }
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
        self.register(CategorySubListCell.self, forCellWithReuseIdentifier: "CategorySubListCell")
        self.backgroundColor = .lightGray
    }
}
