//
//  PostTitleView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/07.
//

import UIKit
import SnapKit


class PostTitleView: UIView {
    
    // 테이블뷰 형태로 보이도록
    let tableViewSortButton = UIButton()
    // collectionView 형태로 보이도록 ( 한 줄에 3개 )
    let collectionViewSortButton = UIButton()
    let bottomBorder = UIView()
    var title: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bind()
        attribute()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //임시
    private func bind(){
        
    }
    
    private func attribute(){
        tableViewSortButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        collectionViewSortButton.setTitle(title, for: .normal)
        collectionViewSortButton.setTitleColor(.black, for: .normal)
        collectionViewSortButton.backgroundColor = .white
        bottomBorder.backgroundColor = .lightGray
    }
    
    private func layout(){
        [tableViewSortButton, collectionViewSortButton, bottomBorder]
            .forEach{
                addSubview($0)
            }
        
        tableViewSortButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
            $0.width.height.equalTo(28)
        }
        
        collectionViewSortButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(6)
            $0.width.equalTo(40)
            $0.height.equalTo(28)
           
        }
        
        bottomBorder.snp.makeConstraints{
            $0.top.equalTo(tableViewSortButton.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
    func setTitle(_ title: String){
        self.title = title
    }
    
    
    
}

