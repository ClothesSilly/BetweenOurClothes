//
//  NewPostViewController.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//


import UIKit
import RxSwift
import RxCocoa
//import Kingfisher

class NewPostViewController: UIViewController {
    let disposeBag = DisposeBag()
    let centerButtonTapped = PublishRelay<Void>()
    
    let searchBar = SearchBar()
    let sortFilterView = SortFilterView()
   //let listView = BlogListView()
    
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
        title = "새로운 글 작성"
        view.backgroundColor = .orange
    }
    private func layout(){
        [searchBar, sortFilterView].forEach {
            view.addSubview($0)
        }
        searchBar.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        sortFilterView.snp.makeConstraints{
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
     
    
    
}
