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
    
    let cellData = Observable.of([
        HomePreviewCellData(commentsCount: 1, id: 1, image: nil, likeCount: 10, title: "제목1입니다제목1입니다제목1입니다제목1입니다제목1입니다제목1입니다"),
        HomePreviewCellData(commentsCount: 11, id: 2, image: nil, likeCount: 11, title: "제목2입니다제목1입니다제목1입니다제목1입니다제목1입니다제목1입니다"),
        HomePreviewCellData(commentsCount: 2, id: 3, image: nil, likeCount: 3, title: "제목3입니다제목1입니다제목1입니다제목1입니다제목1입니다제목1입니다"),
        HomePreviewCellData(commentsCount: 5, id: 4, image: nil, likeCount: 2, title: "제목4입니다제목1입니다제목1입니다제목1입니다제목1입니다제목1입니다"),
        HomePreviewCellData(commentsCount: 7, id: 5, image: nil, likeCount: 5, title: "제목5입니다제목1입니다제목1입니다제목1입니다제목1입니다제목1입니다"),
        HomePreviewCellData(commentsCount: 1, id: 6, image: nil, likeCount: 1, title: "제목6입니다제목1입니다제목1입니다제목1입니다제목1입니다제목1입니다"),
        HomePreviewCellData(commentsCount: 2, id: 7, image: nil, likeCount: 7, title: "제목7입니다제목1입니다제목1입니다제목1입니다제목1입니다제목1입니다"),
        HomePreviewCellData(commentsCount: 2, id: 8, image: nil, likeCount: 7, title: "제목8입니다제목1입니다제목1입니다제목1입니다제목1입니다제목1입니다"),
        HomePreviewCellData(commentsCount: 9, id: 9, image: nil, likeCount: 3, title: "제목9입니다제목1입니다제목1입니다제목1입니다제목1입니다제목1입니다"),
        HomePreviewCellData(commentsCount: 11, id: 10, image: nil, likeCount: 1, title: "제목10입니다제목1입니다제목1입니다제목1입니다제목1입니다제목1입니다"),
    ])
    
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

        cellData
            .bind(to: self.rx.items(
            cellIdentifier: "HomeTwoLineViewCell",
            cellType: HomeTwoLineViewCell.self
            )
        ){ index, data, cell in
                cell.setData(data)
                
               // cell.cmImage = color.

            }.disposed(by: disposeBag)
      
    }
    
    private func attribute(){
        self.backgroundColor = .white
        self.isPagingEnabled = true
        self.showsHorizontalScrollIndicator = true
       
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
