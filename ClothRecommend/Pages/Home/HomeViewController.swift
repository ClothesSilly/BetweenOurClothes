//
//  HomeViewController.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/06.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    // ------------------------------ UI Components ------------------------------ //

    
    let tableView = UITableView()
    let footerView = UIView()
    
    
    
    
    // 배너
    private lazy var bvLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWidth , height: 76)
        return layout
    }()
    
    private lazy var bannerListView = BannerListView(frame: .zero, collectionViewLayout: bvLayout)
    
    // 1. 새로 올라온 중고 물품
    // 최신등록 가져오기
    // 이미지 제목, 찜수, 댓글수
    
    
    
    
    // 추천 상품
    // 찜 가장 많은거
    //
    // 이미지, 제목, 찜수, 댓글수
    
    
    
    
    //오늘의 추천 코디
    // 내 옷장 가장 마지막에 올라온 옷에 대한
    // 이미지,
    // 이미지 제목, 찜수, 댓글수
    
    
    
    
    
    
    
    
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
    
    private func bind(){
        
    }
    
    private func attribute(){
        view.backgroundColor = .white
    }
    
    private func layout(){
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(100)
        }
        view.addSubview(footerView)
        footerView.snp.makeConstraints{
            $0.top.equalTo(tableView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
    
    
    
    
}
