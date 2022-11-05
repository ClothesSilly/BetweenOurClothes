//
//  BannerListViewCell:.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/01.
//

import UIKit
import SnapKit
import Kingfisher


class BannerListViewCell: UICollectionViewCell {
    
    // ------------------------------ UI Components ------------------------------ //
    
    let bannerImageView = UIImageView()
    // ------------------------------ UI Components ------------------------------ //
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        attribute()
        layout()
    }
    
    
    private func attribute(){
        bannerImageView.contentMode = .scaleAspectFill
        bannerImageView.clipsToBounds = true
    }
    
    private func layout(){
        [bannerImageView].forEach {
            contentView.addSubview($0)
        }
        //이미지가 배너를 꽉 채워 구성함
        bannerImageView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setData(_ data: BannerListViewCellData) {

        bannerImageView.kf.setImage(with: data.bannerImageUrl, placeholder: UIImage(named: "event"))
    }
}
