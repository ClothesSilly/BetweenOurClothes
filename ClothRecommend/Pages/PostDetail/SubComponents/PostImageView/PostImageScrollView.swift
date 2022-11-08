//
//  PostImageScrollView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/07.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class PostImageScrollView: UIScrollView {
    
    let pageControl = UIPageControl()
    // ------------------------------ UI Components ------------------------------ //
    let tempUIImageView1 = UIImageView()
    let tempUIImageView2 = UIImageView()
    let tempUIImageView3 = UIImageView()
    let tempUIImageView4 = UIImageView()
    let tempUIImageView5 = UIImageView()
    let tempUIImageView6 = UIImageView()
    let tempUIImageView7 = UIImageView()
    let tempUIImageView8 = UIImageView()
    let tempUIImageView9 = UIImageView()
    let tempUIImageView10 = UIImageView()
    let tempUIImageView11 = UIImageView()
    let tempUIImageView12 = UIImageView()
    let tempUIImageView13 = UIImageView()
    let tempUIImageView14 = UIImageView()
    let tempUIImageView15 = UIImageView()
    let tempUIImageView16 = UIImageView()
    
    
    private let contentView = UIView()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 0.0
        return stackView
    }()
    
    
    
    
    // ------------------------------ UI Components ------------------------------ //
    
    // ------------------------------ Rx Traits ------------------------------ //
    
    let postImageData = PublishSubject<[URL]>()
    
    
    // ------------------------------ Rx Traits ------------------------------ //
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentSize = CGSize(
            width: UIScreen.main.bounds.width ,
            height: 100
        )
        pageControl.numberOfPages = 16
        self.backgroundColor = .lightGray
        self.isScrollEnabled = true
        self.showsHorizontalScrollIndicator = true
        self.isPagingEnabled = true
        self.delegate = self

      
        
        tempUIImageView1.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        tempUIImageView2.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        tempUIImageView3.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        
        tempUIImageView4.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        tempUIImageView5.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        tempUIImageView6.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        tempUIImageView7.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        tempUIImageView8.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        tempUIImageView9.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        tempUIImageView10.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        tempUIImageView11.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        tempUIImageView12.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        tempUIImageView13.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        tempUIImageView14.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        tempUIImageView15.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        tempUIImageView16.kf.setImage(with: URL(string: ""), placeholder: UIImage(systemName: "photo"))
        
        bind()
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func bind(){
        
    }
    
    private func attribute(){
        self.backgroundColor = .blue
        
    }
    
    private func layout(){
        //contentSize.width = UIScreen.main.bounds.size.width

        
        self.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
       
        [tempUIImageView1, tempUIImageView2, tempUIImageView3, tempUIImageView4,tempUIImageView5, tempUIImageView6, tempUIImageView7, tempUIImageView8,tempUIImageView9, tempUIImageView10, tempUIImageView11, tempUIImageView12,tempUIImageView13, tempUIImageView14, tempUIImageView15, tempUIImageView16].forEach{
            stackView.addArrangedSubview($0)
        }
        
        
        
        
    }
    
   
   
    
}

extension PostImageScrollView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // floor 내림, ceil 올림
        // contentOffset는 현재 스크롤된 좌표
        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
}
