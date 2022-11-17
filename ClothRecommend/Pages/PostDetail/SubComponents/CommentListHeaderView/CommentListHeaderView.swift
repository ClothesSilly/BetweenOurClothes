//
//  CommentListHeaderView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/17.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa


class CommentListHeaderView: UIView {
    
    let alarmIconLabel = UIImageView()
    let titleLabel = UILabel()
    let reloadButton = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        self.backgroundColor = .darkGray
        alarmIconLabel.image = UIImage(systemName: "pencil.circle")
        alarmIconLabel.layer.cornerRadius = 20.0
        alarmIconLabel.clipsToBounds = true
        alarmIconLabel.contentMode = .scaleAspectFill
        alarmIconLabel.backgroundColor = .lightGray
        
        alarmIconLabel.tintColor = .systemPink
        
        titleLabel.text = "댓글"
        titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        titleLabel.textColor = .white
        
        reloadButton.image = UIImage(systemName: "arrow.clockwise.circle")
        reloadButton.backgroundColor = .lightGray
        reloadButton.contentMode = .scaleAspectFill
        reloadButton.layer.cornerRadius = 20.0
        reloadButton.clipsToBounds = true
        reloadButton.tintColor = .systemPink
    }
    private func layout(){
        [alarmIconLabel, titleLabel, reloadButton].forEach{
            self.addSubview($0)
        }
        alarmIconLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(40)
        }
        titleLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(alarmIconLabel.snp.trailing).offset(6)
        }
        reloadButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(14)
            $0.height.width.equalTo(40)
            
        }
    }
    
    
    
}
