//
//  CategoryMainListView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//

import UIKit
import RxSwift
import RxCocoa


typealias CategoryMain = ( url: URL?, title: String)

final class CategoryMainListView: UICollectionView {
    let disposeBag = DisposeBag()
    
    
    
    let cellData = [
        CategoryMain(nil, "상의"),
        CategoryMain(nil, "하의"),
        CategoryMain(nil, "아우터"),
        CategoryMain(nil, "원피스")
    ]
    

    override init(frame: CGRect, collectionViewLayout collecViewLayout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collecViewLayout)
        
        bind()
        attribute()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(){
       
        
    }
    private func attribute(){
        self.backgroundColor = .white
        
    }
}
