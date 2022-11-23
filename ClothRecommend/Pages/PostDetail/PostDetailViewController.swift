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
    var isStar: Bool = false
    
    let postData = PublishSubject<SearchResultCellData>()
        .subscribe(
            onNext:{
                print($0)
            })
    
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
   

    
    private lazy var pivLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWidth , height: 300)
        return layout
    }()
    
    private lazy var postImageView = PostImageCollectionView(frame: .zero, collectionViewLayout: pivLayout)
    
    private lazy var spLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 10
        
        layout.scrollDirection = .horizontal
//        let screenWidth = UIScreen.main.bounds.width
//        layout.itemSize = CGSize( width: self, height: 50)
        return layout
    }()
    
    private lazy var selectPostCategoryView = SelectPostCategoryView(frame: .zero, collectionViewLayout: spLayout )
    
    //상세 내용
    let postContentsView = PostContentsView()
    let borderLineView = UIView()
    let footerView = UIView()
    let customButton = UIButton()
    //let leftBarButton = UIImageView(image: UIImage(systemName: "star.fill"))
    let leftBarButton = UIButton()
    let rightBarButton = UIButton()
    
    let listHeaderView = CommentListHeaderView()
    let listView = CommentListTableView()
    let listFooterView = CommentListFooterView()
    
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
        Observable<[String]>.of([
            
            "","","","","","","",""
        ])
            .bind(to: listView.cellData)
            .disposed(by: disposeBag)
    }
    
    private func attribute(){
      
        //viewController 설정
        self.title = "최신글"
        view.backgroundColor = .white
        //찜하기
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(addWishList))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customButton)
        
        leftBarButton.setImage(UIImage(systemName: "star"), for: .normal)
        //leftBarButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
        leftBarButton.tintColor = .systemPink
        leftBarButton.contentVerticalAlignment = .fill
        leftBarButton.contentHorizontalAlignment = .fill
        
        
        rightBarButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        rightBarButton.tintColor = .systemPink
        rightBarButton.contentVerticalAlignment = .fill
        rightBarButton.contentHorizontalAlignment = .fill
        
        leftBarButton.addTarget(self, action: #selector(addWishList), for: .touchUpInside)
        rightBarButton.addTarget(self, action: #selector(clickMenuButton), for: .touchUpInside)
        
        footerView.backgroundColor = .white
        borderLineView.backgroundColor = .lightGray
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
        
        [postTitleView, postImageView, selectPostCategoryView, postContentsView, listHeaderView, listView,listFooterView, borderLineView, footerView].forEach{
            stackView.addArrangedSubview($0)
        }
        
        postImageView.snp.makeConstraints{
            $0.top.equalTo(postTitleView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        selectPostCategoryView.snp.makeConstraints{
              $0.top.equalTo(postImageView.snp.bottom)
              $0.leading.trailing.equalToSuperview()
              $0.height.equalTo(50)
        }
        
        
        postContentsView.snp.makeConstraints{
            $0.top.equalTo(selectPostCategoryView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        listHeaderView.snp.makeConstraints{
            $0.top.equalTo(postContentsView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(70)
        }
        
        listView.snp.makeConstraints{
            $0.top.equalTo(listHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(400)
        }
       
        listFooterView.snp.makeConstraints{
            $0.top.equalTo(listView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        borderLineView.snp.makeConstraints{
            $0.top.equalTo(listFooterView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        footerView.snp.makeConstraints{
            $0.top.equalTo(borderLineView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
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
    }
    
    func renderData(){
//        self.postCellData = cell
    }
    //게시글 id로 wishList에 추가해야한다.
    @objc func addWishList(){
        print("즐겨찾기 추가")
//        guard let isStar = isStar else { return }
        if isStar {
            self.leftBarButton.setImage(UIImage(systemName: "star"), for: .normal)
        } else{
            self.leftBarButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        // 반대로 저장
        isStar = !isStar
    }
    @objc func clickMenuButton(){
        print("메뉴버튼 클릭")
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "글 수정", style: .default, handler: {action in self.aa() })
        let action2 = UIAlertAction(title: "글 삭제", style: .default, handler: {action in self.bb() })
        let action3 = UIAlertAction(title: "돌아가기", style: .destructive, handler: nil)
        [action1, action2,action3].forEach{
            alertController.addAction($0)
        }

        self.present(alertController, animated: true, completion: nil)
    }
    func aa(){
        print("글 수정 섵ㄴ택")
//        self.navigationController?.popViewController(animated: true)
        let vcvm = NewPostViewModel()
        let vc = NewPostViewController(.edit)
        vc.bind(vcvm)
//        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: {print("수정완료!")})
       
    }
    func bb(){
        print("글 삭제 선택")
        self.navigationController?.popViewController(animated: true)
    }
    func cc(){
        print("돌아가기 선택")
    }
}

//typealias Alert = (title: String, message: String?)
//viewModel.presentAlert
//    .emit(to: self.rx.setAlert)
//    .disposed(by: disposeBag)


