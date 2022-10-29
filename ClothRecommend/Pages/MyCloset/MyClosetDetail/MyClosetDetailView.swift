//
//  UsedDetailView.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit


class MyClosetDetailView: UIView {
    
    let closetDetailTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        setUpConstraints()
    }
    
    
    private func setUp() {
        backgroundColor = .white
        addSubview(closetDetailTableView)
        
        closetDetailTableView.register(
            ClosetTagTableViewCell.self,
            forCellReuseIdentifier: ClosetTagTableViewCell.identifer
        )
        
        closetDetailTableView.register(
            ClosetImageTableViewCell.self,
            forCellReuseIdentifier: ClosetImageTableViewCell.identifier
        )
        
        closetDetailTableView.register(
            MyClosetDetailRecommendTableViewCell.self,
            forCellReuseIdentifier: MyClosetDetailRecommendTableViewCell.identifier
        )
    }
    
    
    func setUpConstraints() {
        closetDetailTableView.snp.makeConstraints { 
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
    }
}
