//
//  WishListViewController.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/01.
//


import UIKit
import RxSwift
import RxCocoa
//import Kingfisher

class WishListViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    // components
    let headerCategoryView = HeaderCategoryView()
    let listView = WishListTableView()
    
    let centerButtonTapped = PublishRelay<Void>()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        bind()
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind(){
        
    }
    
    private func attribute(){
        title = "찜"
        view.backgroundColor = .white
    }
    
    private func layout(){
        [headerCategoryView, listView].forEach{
            view.addSubview($0)
        }
        headerCategoryView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        listView.snp.makeConstraints{
            $0.top.equalTo(headerCategoryView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    
}
