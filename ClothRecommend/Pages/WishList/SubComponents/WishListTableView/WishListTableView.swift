//
//  WishListTableView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/01.
//

import UIKit
import RxSwift
import RxCocoa

class WishListTableView: UITableView {
    let disposeBag = DisposeBag()
    
    //MainViewController -> BlogListView
    let cellData = PublishSubject<[BlogListCellData]>()
   
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        bind()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //cellforRowAt을 rx로 표현한 것이 아래와 같다고 생각하면 됨
    private func bind(){
        cellData
            .asDriver(onErrorJustReturn: [])
            .drive(self.rx.items) { tv, row, data in
                let index = IndexPath(row: row, section: 0)
                let cell = tv.dequeueReusableCell(withIdentifier: "WishListTableViewCell", for: index) as! WishListTableViewCell
                cell.setData(data)
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        self.backgroundColor = .brown
        self.register(WishListTableViewCell.self, forCellReuseIdentifier: "WishListTableViewCell")
        self.separatorStyle = .singleLine
        self.rowHeight = 100
    }
    
    
    
}



