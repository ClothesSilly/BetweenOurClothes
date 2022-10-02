//
//  MainFeedView.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/14.
//

import UIKit
import SnapKit

class MainFeedView: UIView {
    
    let mainFeedTableView = UITableView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    
    private func setUp() {
        self.addSubview(mainFeedTableView)
        
        mainFeedTableView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        mainFeedTableView.register(MainFeedTableViewCell.self, forCellReuseIdentifier: MainFeedTableViewCell.identifier)
        mainFeedTableView.rowHeight = UITableView.automaticDimension
    }
    
}
