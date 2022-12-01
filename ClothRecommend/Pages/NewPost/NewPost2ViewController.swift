//
//  NewPost2ViewController.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/12/01.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class NewPost2ViewController: UIViewController{
    
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
    
    let reviseCancelView = UIView()
    let reviseButton = UIButton()
    let cancelButton = UIButton()
    
    let borderLineView = UIView()
    let footerView = UIView()
    
    // ------------------------------ UI Components ------------------------------ //
    
    
    // ------------------------------ Rx Traits ------------------------------ //
    

    
    // ------------------------------ Rx Traits ------------------------------ //

    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
       
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
        view.backgroundColor = .systemBackground
        contentView.backgroundColor = .systemBackground
        scrollView.backgroundColor = .systemBackground
        //찜하기
        
        footerView.backgroundColor = .white
        borderLineView.backgroundColor = .lightGray
        
        reviseButton.setTitle("수정하기", for: .normal)
        reviseButton.setTitleColor(UIColor(red: 206/255.0, green: 196/255.0, blue: 136/255.0, alpha: 1.0), for: .normal)
        reviseButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        reviseButton.titleLabel?.font = .systemFont(ofSize: 18)
        reviseButton.tintColor = UIColor(red: 206/255.0, green: 196/255.0, blue: 136/255.0, alpha: 1.0)
        reviseButton.backgroundColor = .systemBackground
        reviseButton.layer.borderColor = UIColor(red: 206/255.0, green: 196/255.0, blue: 136/255.0, alpha: 1.0).cgColor
        reviseButton.layer.borderWidth = 1.0
        reviseButton.layer.cornerRadius = 10.0
        reviseButton.clipsToBounds = true
        reviseButton.semanticContentAttribute = .forceLeftToRight
        reviseButton.addTarget(self, action: #selector(doRevise), for: .touchUpInside)
        
        cancelButton.setTitle("취소하기", for: .normal)
        cancelButton.setTitleColor(UIColor(red: 216/255.0, green: 126/255.0, blue: 146/255.0, alpha: 1.0), for: .normal)
        cancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 18)
        cancelButton.tintColor = UIColor(red: 216/255.0, green: 126/255.0, blue: 146/255.0, alpha: 1.0)
        cancelButton.backgroundColor = .systemBackground
        cancelButton.layer.borderColor = UIColor(red: 216/255.0, green: 126/255.0, blue: 146/255.0, alpha: 1.0).cgColor
        cancelButton.layer.borderWidth = 1.0
        cancelButton.layer.cornerRadius = 10.0
        cancelButton.clipsToBounds = true
        cancelButton.semanticContentAttribute = .forceLeftToRight
        
        cancelButton.addTarget(self, action: #selector(cancelRevise), for: .touchUpInside)
       
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
        
        [postTitleView, postImageView, selectPostCategoryView, postContentsView, reviseCancelView, borderLineView, footerView].forEach{
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
        
        reviseCancelView.snp.makeConstraints{
            $0.top.equalTo(postContentsView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        borderLineView.snp.makeConstraints{
            $0.top.equalTo(reviseCancelView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        footerView.snp.makeConstraints{
            $0.top.equalTo(borderLineView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        [ reviseButton, cancelButton].forEach{
            reviseCancelView.addSubview($0)
        }
        
        reviseButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(UIScreen.main.bounds.width / 2 - 140)
            $0.height.equalTo(50)
            $0.width.equalTo(120)
        }
        
        cancelButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(UIScreen.main.bounds.width / 2 + 20)
            $0.height.equalTo(50)
            $0.width.equalTo(120)
        }
        
       
    }
    
    func renderData(){
//        self.postCellData = cell
    }
    
    @objc func doRevise(){
        
    }
    
    @objc func cancelRevise(){
        
    }
    
    
  
}
