//
//  CategoryMainListView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//

import UIKit
import RxSwift
import RxCocoa

final class CategoryMainListView: UICollectionView {
    let disposeBag = DisposeBag()
    
    let headerView = SortFilterView(
        frame: CGRect(
            origin: .zero,
            size: CGSize(width: UIScreen.main.bounds.width, height: 50)
        )
    )
    /*Todo*/
//    override init(frame: CGRect, collectionViewLayout collecViewLayout: UICollectionViewLayout) {
//        super.init(frame: frame, collectionViewLayout: UICollectionViewLayout.self)
//    }
//
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func bind(){
        
    }
    private func attribute(){
        self.backgroundColor = .white
        
    }
}
