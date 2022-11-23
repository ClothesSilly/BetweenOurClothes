//
//  WishListTableView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/01.
//

import UIKit
import RxSwift
import RxCocoa


//
class WishListTableView: UITableView {
    let disposeBag = DisposeBag()
    
    //MainViewController -> WishListTableView
    let cellData = PublishSubject<[SearchResultCellData]>()
    
    let selectedCellData = PublishSubject<SearchResultCellData>()
   
    
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
        
        self.rx.modelSelected(SearchResultCellData.self)
            .bind(to: selectedCellData)
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        self.backgroundColor = UIColor(red: 246/255.0, green: 146/255.0, blue: 182/255.0, alpha: 1.0)
        self.register(WishListTableViewCell.self, forCellReuseIdentifier: "WishListTableViewCell")
        self.separatorStyle = .singleLine
        self.rowHeight = 120
    }
    
    
    
}



