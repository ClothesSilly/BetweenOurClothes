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
    let reloadButton = UIButton()
    
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
        self.backgroundColor = .systemBackground
        alarmIconLabel.image = UIImage(systemName: "bell.circle")
        alarmIconLabel.layer.cornerRadius = 15.0
        alarmIconLabel.clipsToBounds = true
        alarmIconLabel.contentMode = .scaleAspectFill
        alarmIconLabel.backgroundColor = .systemBackground
        
        alarmIconLabel.tintColor = UIColor(red: 246/255.0, green: 186/255.0, blue: 156/255.0, alpha: 1.0)
        
        titleLabel.text = "댓글"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .darkGray
        
        reloadButton.setImage(UIImage(systemName: "goforward"), for: .normal)
        reloadButton.backgroundColor = .systemBackground
        reloadButton.contentMode = .scaleAspectFill
        reloadButton.layer.cornerRadius = 25.0
        reloadButton.clipsToBounds = true
        reloadButton.tintColor = UIColor(red: 246/255.0, green: 186/255.0, blue: 156/255.0, alpha: 1.0)
        
        reloadButton.addTarget(self, action: #selector(reloadComments), for: .touchUpInside)
    }
    
    @objc func reloadComments(){
        print("리로드 버튼 클릭")
    }
    private func layout(){
        [alarmIconLabel, titleLabel, reloadButton].forEach{
            self.addSubview($0)
        }
        alarmIconLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(30)
        }
        titleLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(alarmIconLabel.snp.trailing).offset(6)
        }
        reloadButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(14)
            $0.height.width.equalTo(50)
            
        }
    }
    
    
    
}
