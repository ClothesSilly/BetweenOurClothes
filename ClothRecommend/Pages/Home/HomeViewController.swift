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

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0.0
        return stackView
    }()
    
    
    //배너
    private lazy var bvLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWidth , height: 100)
        return layout
    }()
    
    private lazy var bannerListView = BannerListView(frame: .zero, collectionViewLayout: bvLayout)
    
    
    private lazy var cvLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
       
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: (screenWidth - 40) / 3 , height: 180)
        return layout
    }()
    
    private lazy var cv2Layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
       
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: (screenWidth ) / 3 , height: 205)
        return layout
    }()
    
    private lazy var welcomeNicknameView = HomeSectionTitleView()
    // 1. 새로 올라온 중고 물품
    // 최신등록 가져오기
    // 이미지 제목, 찜수, 댓글수
    private lazy var newPostSectionTitleView = HomeSectionTitleView()
    
    private lazy var newPostSectionView = HomeTwoLineView(frame: .zero, collectionViewLayout: cv2Layout)
    
    // 2.추천 상품
    // 찜 가장 많은거
    //
    // 이미지, 제목, 찜수, 댓글수
    private lazy var mostLikedSectionTitleView = HomeSectionTitleView()
    
    private lazy var mostLikedSectionView = HomeTwoLineView(frame: .zero, collectionViewLayout: cv2Layout)
    //3.오늘의 추천 코디
    // 내 옷장 가장 마지막에 올라온 옷에 대한
    // 이미지,
    // 이미지 제목, 찜수, 댓글수
    private lazy var recommendSectionTitleView = HomeSectionTitleView()
    
    private lazy var recommendSectionView = HomeTwoLineView(frame: .zero, collectionViewLayout: cvLayout)
    
  
    
    let footerView = UIView()
    
    
    // ------------------------------ UI Components ------------------------------ //
    
    
    // ------------------------------ Rx Traits ------------------------------ //
    
    
    // TabBarController에서 AlertController가 표현되지 않는다면 다른 ViewController로 옮겨줘야함
    // 버튼이 tap되었고, 새 글 작성, 옷장에 옷걸기 중 어떤것이 선택되었는지 그 정보를 함께 받아옴
    
    let alertActionTapped = PublishRelay<AlertAction>()
    let centerButtonTapped = PublishRelay<Void>()
    
    
    
    // ------------------------------ Rx Traits ------------------------------ //
    
   
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
//        bind()
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
    
    func bind(_ viewModel: HomeViewModel){

    }
    
    private func attribute(){
        view.backgroundColor = .white
        scrollView.backgroundColor = .systemBackground
        contentView.backgroundColor = .systemBackground
        stackView.backgroundColor = .systemBackground
        
        welcomeNicknameView.titleLabel.text = "닉네임님 환영합니다"
        welcomeNicknameView.titleLabel.textColor = UIColor(red: 216/225.0, green: 106/255.0, blue: 142/255.0, alpha: 1.0)
        welcomeNicknameView.titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        
        
        newPostSectionTitleView.titleLabel.text = "새로 올라온 Item"
        mostLikedSectionTitleView.titleLabel.text = "추천 상품 (찜 갯수 기반)"
        recommendSectionTitleView.titleLabel.text = "오늘의 추천 코디"
//        homeTwoLineView.isPagingEnabled = true
       
    }
    
    private func layout(){
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            //가로를 고정시켜주어 세로스크롤 뷰가 된다.
            $0.width.equalToSuperview()
        }
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        //stackView에 컴포넌트들 추가
        [bannerListView, welcomeNicknameView, newPostSectionTitleView, newPostSectionView, mostLikedSectionTitleView, mostLikedSectionView, recommendSectionTitleView, recommendSectionView,footerView].forEach{
            stackView.addArrangedSubview($0)
        }
        
        bannerListView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        welcomeNicknameView.snp.makeConstraints{
            $0.top.equalTo(bannerListView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        
        newPostSectionTitleView.snp.makeConstraints{
            $0.top.equalTo(welcomeNicknameView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        newPostSectionView.snp.makeConstraints{
            $0.top.equalTo(newPostSectionTitleView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(420)
        }
        
        mostLikedSectionTitleView.snp.makeConstraints{
            $0.top.equalTo(newPostSectionView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        mostLikedSectionView.snp.makeConstraints{
            $0.top.equalTo(mostLikedSectionTitleView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(420)
        }
        
        recommendSectionTitleView.snp.makeConstraints{
            $0.top.equalTo(mostLikedSectionView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        recommendSectionView.snp.makeConstraints{
            $0.top.equalTo(recommendSectionTitleView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(210)
        }
        
        footerView.snp.makeConstraints{
            $0.top.equalTo(recommendSectionView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }

        
        
        
    }
    
    
    
    
}

