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
        CategorySub(nil, "탑"),
        CategorySub(nil, "티셔츠"),
        CategorySub(nil, "셔츠"),
        CategorySub(nil, "후드티"),
        CategorySub(nil, "블라우스"),
        CategorySub(nil, "니트웨어"),
        CategorySub(nil, "브라탑")
    ])
    
    let cellDataPants = Observable.of([
        CategorySub(nil, "조거팬츠"),
        CategorySub(nil, "청바지"),
        CategorySub(nil, "팬츠"),
        CategorySub(nil, "레깅스"),
        CategorySub(nil, "스커트"),
    ])
    
    let cellDataOuter = Observable.of([
        CategorySub(nil, "코트"),
        CategorySub(nil, "패딩"),
        CategorySub(nil, "가디건"),
        CategorySub(nil, "재킷"),
        CategorySub(nil, "짚업"),
        CategorySub(nil, "점퍼"),
        CategorySub(nil, "베스트")
    ])
    
    let cellDataOnePiece = Observable.of([
        CategorySub(nil, "점프수트"),
        CategorySub(nil, "드레스"),
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
                
               // cell.cmImage = color.
                cell.setData(data)
            }.disposed(by: disposeBag)
        
    }
    private func attribute(){
        self.register(CategorySubListCell.self, forCellWithReuseIdentifier: "CategorySubListCell")
        self.backgroundColor = .white
    }
}
