//
//  HomeTwoLineView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/16.
//

import UIKit
import RxCocoa
import RxSwift
import Foundation

class HomeTwoLineView: UICollectionView {
    let disposeBag = DisposeBag()
    
    let cellData = Observable.of([ 1,2,3,4,5, 6, 7, 8, 9, 10])
    
    // ------------------------------ UI Components ------------------------------ //
    // ------------------------------ UI Components ------------------------------ //
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.register(HomeTwoLineViewCell.self, forCellWithReuseIdentifier: "HomeTwoLineViewCell")
//        self.register(HeaderTwoLineHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderTwoLineHeaderView")
        bind()
        attribute()
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func bind(){
//        cellData
//            .bind(to: collectionView.rx.items(
//                cellIdentifier: "HomeTwoLineViewCellCVCell",
//                cellType: HomeTwoLineViewCellCVCell.self
//            )
//            ){ idx, data, cell in
//
//            }.disposed(by: disposeBag)
        cellData
            .bind(to: self.rx.items(
            cellIdentifier: "HomeTwoLineViewCell",
            cellType: HomeTwoLineViewCell.self
            )
        ){ index, data, cell in
                cell.backgroundColor = .systemMint
               // cell.cmImage = color.

            }.disposed(by: disposeBag)
      
    }
    
    private func attribute(){
        self.backgroundColor = .systemMint
       
    }
    
    private func layout(){
//        [titleLabel, collectionView, moreViewButton].forEach{
//            contentView.addSubview($0)
//        }
//
//        titleLabel.snp.makeConstraints{
//            $0.leading.top.equalToSuperview().inset(4)
//
//        }
//
//        collectionView.snp.makeConstraints{
//            $0.leading.trailing.equalToSuperview().inset(4)
//            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
//            $0.height.equalTo(250)
//        }
//
//        moreViewButton.snp.makeConstraints{
//            $0.leading.trailing.equalToSuperview().inset(4)
//            $0.top.equalTo(collectionView.snp.bottom).offset(6)
//            $0.bottom.equalToSuperview().inset(2)
    
    }
}