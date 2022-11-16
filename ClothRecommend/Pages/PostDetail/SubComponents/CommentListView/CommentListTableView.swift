//
//  CommentListTableView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/16.
//

import UIKit
import RxSwift
import RxCocoa

class CommentListTableView: UITableView {
    let disposeBag = DisposeBag()
    
    //ViewController -> CommentListTableView
    let cellData = PublishSubject<[String]>()
   
    
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
                let cell = tv.dequeueReusableCell(withIdentifier: "CommentListTableViewCell", for: index) as! CommentListTableViewCell
                
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        self.backgroundColor = .brown
        self.register(CommentListTableViewCell.self, forCellReuseIdentifier: "CommentListTableViewCell")
        self.separatorStyle = .singleLine
        self.rowHeight = 100
    }
    
    
    
}
