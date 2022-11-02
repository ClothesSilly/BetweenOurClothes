//
//  WishListViewController.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/02.
//


import UIKit
import RxSwift
import RxCocoa
//import Kingfisher

class WishListViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    // ------------------------------ UI Components ------------------------------ //

    let headerCategoryView = HeaderCategoryView()
    //찜 목록
    let listView = WishListTableView()
    //let searchResultlistView = SearchResultTableView()
    
    // ------------------------------ UI Components ------------------------------ //
    
    // ------------------------------ Rx Traits ------------------------------ //
    
    // TabBarController에서 AlertController가 표현되지 않는다면 다른 ViewController로 옮겨줘야함
    // 버튼이 tap되었고, 새 글 작성, 옷장에 옷걸기 중 어떤것이 선택되었는지 그 정보를 함께 받아옴
    let alertActionTapped = PublishRelay<AlertAction>()
    
    let centerButtonTapped = PublishRelay<Void>()
    
    // ------------------------------ Rx Traits ------------------------------ //
        

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        bind()
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        Observable<[SearchResultCellData]>.of([
            
            SearchResultCellData(title: "임시 title1", price: 10000, content: "임시 content1", status: "판매중 임시", transport: "직거래", datetime: nil, thumbnailImageUrl: nil),
            SearchResultCellData(title: "임시 title2", price: 20000, content: "임시 content2", status: "판매완료임시", transport: "직거래", datetime: nil, thumbnailImageUrl: nil),
            SearchResultCellData(title: "임시 title3", price: 30000, content: "임시 content3", status: "판매중", transport: "직거래", datetime: nil, thumbnailImageUrl: nil)
        ])
            .bind(to: listView.cellData)
            .disposed(by: disposeBag)
        
    }
    
    private func attribute(){
        title = "찜 목록"
        view.backgroundColor = .white
    }
    
    private func layout(){
        [headerCategoryView, listView].forEach {
            view.addSubview($0)
        }
        headerCategoryView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        listView.snp.makeConstraints{
            $0.top.equalTo(headerCategoryView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
}

