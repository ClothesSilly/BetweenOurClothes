//
//  SelectPostCategoryView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/07.
//

import UIKit
import RxSwift
import RxCocoa

class SelectPostCategoryView: UICollectionView {
    let disposeBag = DisposeBag()
    
    let cellData = Observable.of([
        "  상의  ", "  후드  ", "  베이지  ", "  오버핏  ","  울  ", "  폴리에스테르  "
    ])
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.register(SelectPostCategoryViewCell.self, forCellWithReuseIdentifier: "SelectPostCategoryViewCell")
        bind()
        attribute()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind(){
        cellData
            .bind(to: self.rx.items(
            cellIdentifier: "SelectPostCategoryViewCell",
            cellType: SelectPostCategoryViewCell.self
            )
        ){ index, data, cell in
                cell.pcButton.setTitle(data, for: .normal)
               // cell.cmImage = color.
            }.disposed(by: disposeBag)
    }
    
    private func attribute(){
   
//        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(red: 286/255.0, green: 186/255.0, blue: 212/255.0, alpha: 1.0)
//        self.isScrollEnabled = true
    }    
}
