//
//  PostDetailViewController.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/07.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class PostDetailViewController: UIViewController{
    
    let disposeBag = DisposeBag()
    var postCellData: SearchResultCellData?
    
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
    
    let postTitleView = PostTitleView()
    let selectPostCategoryView = SelectPostCategoryView()
    private lazy var postImageScrollView: UIImageView = {
        let uiImageView = UIImageView()
        uiImageView.contentMode = .scaleAspectFit
        uiImageView.kf.setImage(with: URL(string: ""), placeholder: UIImage(named: "upper"))
        return uiImageView
    }()
    //상세 내용
    let postContentsView = PostContentsView()
    let tempText = UITextView()
    let customButton = UIButton()
    //let leftBarButton = UIImageView(image: UIImage(systemName: "star.fill"))
    let leftBarButton = UIButton()
    let rightBarButton = UIButton()
    
    // ------------------------------ UI Components ------------------------------ //
    
    
    // ------------------------------ Rx Traits ------------------------------ //
    
    
    //
  
    
    
    // ------------------------------ Rx Traits ------------------------------ //

    init(pcData pcData: SearchResultCellData? ) {
        super.init(nibName: nil, bundle: nil)
        postCellData = pcData
       
        
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
      
        //viewController 설정
        self.title = "최신글"
        view.backgroundColor = .white
        //찜하기
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(addWishList))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customButton)
        tempText.backgroundColor = .green
        tempText.textColor = .black
        tempText.textAlignment = .center
        tempText.text = postCellData?.title ?? "lslls"
        
        leftBarButton.setImage(UIImage(systemName: "star"), for: .normal)
        leftBarButton.tintColor = .systemPink
        leftBarButton.contentVerticalAlignment = .fill
        leftBarButton.contentHorizontalAlignment = .fill
        
        
        rightBarButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        rightBarButton.tintColor = .systemPink
        rightBarButton.contentVerticalAlignment = .fill
        rightBarButton.contentHorizontalAlignment = .fill
        
        leftBarButton.addTarget(self, action: #selector(addWishList), for: .touchUpInside)
        rightBarButton.addTarget(self, action: #selector(clickMenuButton), for: .touchUpInside)
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
            //높이를 고정시켜주어 가로스크롤 뷰가 된다.
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        [postTitleView, selectPostCategoryView, postImageScrollView, postContentsView, tempText].forEach{
            stackView.addArrangedSubview($0)
        }
        
        selectPostCategoryView.snp.makeConstraints{
              $0.leading.trailing.equalToSuperview()
              $0.height.equalTo(50)
        }
        
        
        postImageScrollView.snp.makeConstraints{
            $0.top.equalTo(selectPostCategoryView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        postContentsView.snp.makeConstraints{
            $0.top.equalTo(postImageScrollView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(400)
        }
       
        tempText.snp.makeConstraints{
            $0.top.equalTo(postContentsView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        customButton.snp.makeConstraints{
            $0.height.equalTo(30)
            $0.width.equalTo(92)
        }
        [leftBarButton, rightBarButton].forEach{
            customButton.addSubview($0)
        }
        
        leftBarButton.snp.makeConstraints{
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(36)
        }
        
        rightBarButton.snp.makeConstraints{
            $0.trailing.top.bottom.equalToSuperview().inset(2)
            $0.width.equalTo(32)
        }
            
    
       
        
        
        
       
        
        
        
//        postTitleView.snp.makeConstraints{
//            $0.top.equalTo(view.safeAreaLayoutGuide)
//            $0.leading.trailing.equalToSuperview()
////            $0.height.lessThanOrEqualTo(200)
//        }
//
//        selectPostCategoryView.snp.makeConstraints{
//            $0.top.equalTo(postTitleView.snp.bottom)
//            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(50)
//
//        }
//        postImageScrollView.snp.makeConstraints{
//            $0.top.equalTo(selectPostCategoryView.snp.bottom)
//            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(500)
//        }
//
//        tempText.snp.makeConstraints{
//            $0.top.equalTo(postImageScrollView.snp.bottom)
//            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(50)
//        }
    }
    
    func setData(_ cell: SearchResultCellData){
        self.postCellData = cell
    }
    //게시글 id로 wishList에 추가해야한다.
    @objc func addWishList(){
        print("즐겨찾기 추가")
    }
    @objc func clickMenuButton(){
        print("메뉴버튼 클릭")
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "글 수정", style: .default, handler: nil)
        let action2 = UIAlertAction(title: "글 삭제", style: .default, handler: nil)
        let action3 = UIAlertAction(title: "돌아가기", style: .cancel, handler: nil)
        [action1, action2,action3].forEach{
            alertController.addAction($0)
        }
  
        self.present(alertController, animated: true, completion: nil)
    }
}

//typealias Alert = (title: String, message: String?)
//viewModel.presentAlert
//    .emit(to: self.rx.setAlert)
//    .disposed(by: disposeBag)


