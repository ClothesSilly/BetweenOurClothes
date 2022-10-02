//
//  ShopViewTableViewCell.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/14.
//

import UIKit
import SnapKit

final class ShopViewTableViewCell: UITableViewCell {
    
    static let identifer = "ShopViewTableViewCell"
    
    let thumnailImage = UIImageView()
    let title = UILabel()
    let price = UILabel()
    let content = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        setUpConstraints()
    }
    
    private func setUp() {
        addSubview(thumnailImage)
        addSubview(title)
        addSubview(price)
        addSubview(content)
    }
    
    private func setUpConstraints() {
        
    }
    
}
