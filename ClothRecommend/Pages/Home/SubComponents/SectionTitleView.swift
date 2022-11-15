//
//  SectionTitleView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/15.
//

import UIKit
import RxSwift
import RxCocoa

class SectionTitleView: UIView {
    let disposeBag = DisposeBag()
    
    
//    // 테이블뷰 형태로 보이도록
//    let sectionTitleLable = UILabel()
//    // collectionView 형태로 보이도록 ( 한 줄에 3개 )
//    let collectionViewSortButton = UIButton()
//    let bottomBorder = UIView()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        bind()
//        attribute()
//        layout()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    //임시
//    private func bind(){
//        //tableView로 정렬하자!
//        tableViewSortButton.rx.tap
//            .bind(to: tvSortButtonTapped)
//            .disposed(by: disposeBag)
//
//        //collectionView로 정렬하자!
//        collectionViewSortButton.rx.tap
//            .bind(to: cvSortButtonTapped)
//            .disposed(by: disposeBag)
//    }
//
//    private func attribute(){
//        tableViewSortButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
//        collectionViewSortButton.setImage(UIImage(systemName: "calendar.badge.plus"), for: .normal)
//        bottomBorder.backgroundColor = .lightGray
//    }
//
//    private func layout(){
//        [tableViewSortButton, collectionViewSortButton, bottomBorder]
//            .forEach{
//                addSubview($0)
//            }
//
//        tableViewSortButton.snp.makeConstraints{
//            $0.top.equalToSuperview()
//            $0.trailing.equalToSuperview().inset(12)
//            $0.width.height.equalTo(28)
//        }
//
//        collectionViewSortButton.snp.makeConstraints{
//            $0.top.equalToSuperview()
//            $0.trailing.equalTo(tableViewSortButton.snp.leading).offset(-6)
//            $0.width.height.equalTo(28)
//        }
//
//        bottomBorder.snp.makeConstraints{
//            $0.top.equalTo(tableViewSortButton.snp.bottom)
//            $0.leading.trailing.bottom.equalToSuperview()
//            $0.height.equalTo(0.5)
//        }
//    }
    
    
    
}
