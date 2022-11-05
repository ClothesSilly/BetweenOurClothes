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
    // Title Bar
    
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
    
    // 새로 올라온 중고 물품
    
    //추천 상품
    
    // 인기 HOT! 쇼핑몰 상품
    
    //오늘의 추천 코디
    
    
    
    
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
        [bannerListView].forEach{
            view.addSubview($0)
        }
        
        bannerListView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(120)
        }
    }
    
    
    
    
}
