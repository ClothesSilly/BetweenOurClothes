//
//  ClothesImageViewCell.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/15.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa


class ClothesImageViewCell: UITableViewCell {
    let disposeBag = DisposeBag()
    
    let ImageView = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        bind()
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func bind(){
        
    }
    
    private func attribute(){
        ImageView.contentMode = .scaleAspectFill
        ImageView.clipsToBounds = true
        ImageView.kf.setImage(with: URL(string: ".."), placeholder: UIImage(systemName: "photo"))
    }
    
    private func layout(){
        [ImageView].forEach{
            contentView.addSubview($0)
        }
        
        ImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.height.equalTo(250)
        }
    }
}
