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
            
            SearchResultCellData(id: 1, content: "111글 content글 content글 content글 content글 content글 content", image: nil, modifiedDate: "09.11.01", price: "100000", title: "발렌시아가 C컬 패딩 판매합니다", transport: "직거래"),
            SearchResultCellData(id: 2, content: "222글 content글 content글 content글 content글 content글 content", image: nil, modifiedDate: "09.11.01", price: "10000", title: "보테가 베네타 가디건 판매", transport: "택배"),
            SearchResultCellData(id: 3, content: "333글 content글 content글 content글 content글 content글 content", image: nil, modifiedDate: "09.11.01", price: "200000", title: "발렌시아가 후드티", transport: "택배"),
            SearchResultCellData(id: 4, content: "444글 content글 content글 content글 content글 content글 content", image: nil, modifiedDate: "09.11.01", price: "300000", title: "아미 울 가디건 팝니다", transport: "직거래"),
            SearchResultCellData(id: 5, content: "555글 content글 content글 content글 content글 content글 content", image: nil, modifiedDate: "09.11.01", price: "110000", title: "꼼데 f/w가디건 판매", transport: "직거래"),
            SearchResultCellData(id: 6, content: "666글 content글 content글 content글 content글 content글 content", image: nil, modifiedDate: "09.11.01", price: "120000", title: "발렌시아가 C컬 패딩 판매합니다", transport: "직거래"),
            SearchResultCellData(id: 7, content: "777글 content글 content글 content글 content글 content글 content", image: nil, modifiedDate: "09.11.01", price: "200000", title: "발렌시아가 C컬 패딩 판매합니다", transport: "직거래"),
            SearchResultCellData(id: 8, content: "888글 content글 content글 content글 content글 content글 content", image: nil, modifiedDate: "09.11.01", price: "410000", title: "발렌시아가 C컬 패딩 판매합니다", transport: "직거래"),
            SearchResultCellData(id: 9, content: "999글 content글 content글 content글 content글 content글 content", image: nil, modifiedDate: "09.11.01", price: "170000", title: "발렌시아가 C컬 패딩 판매합니다", transport: "직거래"),
            SearchResultCellData(id: 10, content: "101010글 content글 content글 content글 content글 content글 content", image: nil, modifiedDate: "09.11.01", price: "100000", title: "발렌시아가 C컬 패딩 판매합니다", transport: "직거래"),
            SearchResultCellData(id: 11, content: "111111글 content글 content글 content글 content글 content글 content", image: nil, modifiedDate: "09.11.01", price: "100000", title: "발렌시아가 C컬 패딩 판매합니다", transport: "직거래"),
        ])
            .bind(to: listView.cellData)
            .disposed(by: disposeBag)
        
        listView.selectedCellData
            .subscribe(
                onNext: { pcd in
                    print(pcd)
                    print("pcd 전송 완료")
                    let vc = PostDetailViewController(pcData: pcd )
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

