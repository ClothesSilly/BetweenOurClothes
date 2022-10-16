//
//  FilterHeader.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/13.
//

import UIKit

class FilterHeader: UICollectionReusableView {
    
    static let identifier = "FilterHeader"
    
    let filterHeader = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUp() {
        addSubview(filterHeader)
        filterHeader.text = "Gg"
        filterHeader.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
