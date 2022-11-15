//
//  SearchResultTableView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/30.
//

import UIKit
import RxSwift
import RxCocoa

class SearchResultTableView: UITableView {
    let disposeBag = DisposeBag()
    
    //MainViewController -> 이곳 tableView
    //TableView에 뿌려질 SearchResultCellData Entity Data들을 받아올 것임
    let cellData = PublishSubject<[SearchResultCellData]>()
    
    let postCellData = PublishSubject<SearchResultCellData>()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        bind()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind(){
        cellData
            .asDriver(onErrorJustReturn: [])
            .drive(self.rx.items) { tv, row, data in
                let index = IndexPath(row: row, section: 0)
                let cell = tv.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: index) as! SearchResultTableViewCell
                cell.setData(data)
                return cell
            }
            .disposed(by: disposeBag)
        
        self.rx.itemSelected
            .subscribe(onNext:{ item in
                print("00000000")
                print(item)
                
            }).disposed(by: disposeBag)
        
//        self.rx.modelSelected(SearchResultCellData.self)
//            .subscribe(onNext: { item in
//                print("kkk")
//                print(type(of:item))
//
//            }).disposed(by: disposeBag)
        
        self.rx.modelSelected(SearchResultCellData.self)
            .bind(to: postCellData)
            .disposed(by: disposeBag)
        
    }
    
    private func attribute(){
        self.backgroundColor = .black
        self.register(SearchResultTableViewCell.self, forCellReuseIdentifier: "SearchResultTableViewCell")
        self.separatorStyle = .singleLine
        self.rowHeight = 140
    }
}
