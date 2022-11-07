//
//  PostDetailViewController.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/07.
//

import UIKit
import RxSwift
import RxCocoa

class PostDetailViewController: UIViewController {
    let disposeBag = DisposeBag()
    var postCellData: SearchResultCellData?
    
    // ------------------------------ UI Components ------------------------------ //
    
    
    let postTitleView = PostTitleView()
    let tempText = UITextView()
    
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
    
    
    
//    {
//
//    }
//
    
    private func bind(){
        
    }
    
    private func attribute(){
        view.backgroundColor = .magenta
        tempText.backgroundColor = .green
        tempText.textColor = .black
        tempText.textAlignment = .center
        tempText.text = postCellData?.title ?? "lslls"
    }
    
    private func layout(){
        [postTitleView, tempText].forEach{
            view.addSubview($0)
        }
        postTitleView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        tempText.snp.makeConstraints{
            $0.top.equalTo(postTitleView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
    
    func setData(_ cell: SearchResultCellData){
        self.postCellData = cell
    }
}
