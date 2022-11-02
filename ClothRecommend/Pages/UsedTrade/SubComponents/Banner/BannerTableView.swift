//
//  BannerTableView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//

import UIKit
import RxSwift
import RxCocoa

class BannerTableView: UITableView {
    let disposeBag = DisposeBag()
    
    // ------------------------------ Rx Traits ------------------------------ //
    
    //최상위 ViewController에서 배너 이미지를 받아와 이곳에 bind해줄 것이다.
    let cellData = PublishSubject<[BannerTableViewCellData]>()
    
    // ------------------------------ Rx Traits ------------------------------ //
    
    
    
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
            .drive(self.rx.items){ tv, row, data in
                let index = IndexPath(row: row, section: 0)
                let cell = tv.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: index) as! BannerTableViewCell
                cell.setData(data)
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    private func attribute(){
        self.backgroundColor = .cyan
        self.register(BannerTableViewCell.self, forCellReuseIdentifier: "BannerTableViewCell")
        self.separatorStyle = .singleLine
        self.rowHeight = 140
        self.numberOfRows(inSection: 1)
        //self.scroll
    }
}
