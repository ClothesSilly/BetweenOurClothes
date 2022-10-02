//
//  ShopView.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/14.
//

import UIKit
import SnapKit

class ShopView: UIView {
    
    let shopTableView = UITableView()
    
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
        self.addSubview(shopTableView)
    }
    
    private func setUpConstraints() {
        
    }
    
    
    
    
}
