//
//  SortFilterView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//
import UIKit
import RxSwift
import RxCocoa
import SnapKit


//FilterView 버튼이 눌렸을 때, 다른 View인 테이블뷰가 원소 나열을 다시 해야하므로, event를 밖으로 던져줘야 할 것이다.
// 이를 생각하고 Rx traits를 구성해야한다.
class SortFilterView: UITableViewHeaderFooterView {
    let disposeBag = DisposeBag()
    // TODO: 임시
    let tvSortButtonTapped = PublishRelay<Void>()
    let cvSortButtonTapped = PublishRelay<Void>()
    
    // 테이블뷰 형태로 보이도록
    let tableViewSortButton = UIButton()
    // collectionView 형태로 보이도록 ( 한 줄에 3개 )
    let collectionViewSortButton = UIButton()
    let bottomBorder = UIView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        //TODO: 임시
        bind()
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //임시
    private func bind(){
        //tableView로 정렬하자!
        tableViewSortButton.rx.tap
            .bind(to: tvSortButtonTapped)
            .disposed(by: disposeBag)
        
        //collectionView로 정렬하자!
        collectionViewSortButton.rx.tap
            .bind(to: cvSortButtonTapped)
            .disposed(by: disposeBag)
    }
    
    private func attribute(){
        tableViewSortButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        collectionViewSortButton.setImage(UIImage(systemName: "calendar.badge.plus"), for: .normal)
        bottomBorder.backgroundColor = .lightGray
    }
    
    private func layout(){
        [tableViewSortButton, collectionViewSortButton, bottomBorder]
            .forEach{
                addSubview($0)
            }
        
        tableViewSortButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
            $0.width.height.equalTo(28)
        }
        
        collectionViewSortButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalTo(tableViewSortButton.snp.leading).offset(-6)
            $0.width.height.equalTo(28)
        }
        
        bottomBorder.snp.makeConstraints{
            $0.top.equalTo(tableViewSortButton.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
    
    
    
}
