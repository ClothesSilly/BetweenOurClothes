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
    let tempUrl = URL(fileURLWithPath:  "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMTdfMjE2%2FMDAxNjY2MDE1MzQyNjA1.NI7FzhHVmbmj9LX_EZanMQMudk6jQTUHX0YWTu7S_84g.SJzmqRhLpQA76Kp8ToQTi_hChh8SM1O1fw9CSYQGfPwg.JPEG.youth121%2FIMG_4728.JPG&type=a340")
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
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func bind() {
        Observable<[SearchResultCellData]>.of([
            
            SearchResultCellData(title: "임시 title1", price: 10000, content: "임시 content1", status: "판매중 임시", transport: "직거래", datetime: Date(), thumbnailImageUrl: tempUrl),
            SearchResultCellData(title: "임시 title2", price: 20000, content: "임시 content2", status: "판매완료임시", transport: "직거래", datetime: Date(), thumbnailImageUrl: tempUrl),
            SearchResultCellData(title: "임시 title3", price: 30000, content: "임시 content3", status: "판매중", transport: "직거래", datetime: Date(), thumbnailImageUrl: tempUrl),
            SearchResultCellData(title: "임시 title11", price: 10000, content: "임시 content1", status: "판매중 임시", transport: "직거래", datetime: Date(), thumbnailImageUrl: tempUrl),
            SearchResultCellData(title: "임시 title21", price: 20000, content: "임시 content2", status: "판매완료임시", transport: "직거래", datetime: Date(), thumbnailImageUrl: tempUrl),
            SearchResultCellData(title: "임시 title31", price: 30000, content: "임시 content3", status: "판매중", transport: "직거래", datetime: Date(), thumbnailImageUrl: tempUrl),
            SearchResultCellData(title: "임시 title12", price: 10000, content: "임시 content1", status: "판매중 임시", transport: "직거래", datetime: Date(), thumbnailImageUrl: tempUrl),
            SearchResultCellData(title: "임시 title22", price: 20000, content: "임시 content2", status: "판매완료임시", transport: "직거래", datetime: Date(), thumbnailImageUrl: tempUrl),
            SearchResultCellData(title: "임시 title32", price: 30000, content: "임시 content3", status: "판매중", transport: "직거래", datetime: Date(), thumbnailImageUrl: tempUrl),
            SearchResultCellData(title: "임시 title13", price: 10000, content: "임시 content1", status: "판매중 임시", transport: "직거래", datetime: Date(), thumbnailImageUrl: tempUrl),
            SearchResultCellData(title: "임시 title24", price: 20000, content: "임시 content2", status: "판매완료임시", transport: "직거래", datetime: Date(), thumbnailImageUrl: tempUrl),
            SearchResultCellData(title: "임시 title35", price: 30000, content: "임시 content3", status: "판매중", transport: "직거래", datetime: Date(), thumbnailImageUrl: tempUrl)
        ])
            .bind(to: listView.cellData)
            .disposed(by: disposeBag)
        
        listView.selectedCellData
            .subscribe(
                onNext: { pcd in
                    print(pcd)
                    print("pcd 전송 완료")
                    let vc = PostDetailViewController(pcData: pcd)
                    self.navigationController?.pushViewController(vc, animated: true)
                }, onError: { error in
                    print(error)

                }, onCompleted: {
                    print("끝")

                })
        
    }
    
    private func attribute(){
        title = "찜 목록"
        view.backgroundColor = .white
        
        headerCategoryView.backgroundColor = .systemBackground
        
    }
    
    private func layout(){
        [headerCategoryView, listView].forEach {
            view.addSubview($0)
        }
        headerCategoryView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        listView.snp.makeConstraints{
            $0.top.equalTo(headerCategoryView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
}

