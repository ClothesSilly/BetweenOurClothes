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
    func convertBase64StringToImage (imageBase64String:String?) -> UIImage {
        if imageBase64String == nil {
            return UIImage(named: "event")!
        }
        let imageData = Data.init(base64Encoded: imageBase64String!, options: .init(rawValue: 0))
        let image = UIImage(data: imageData!)!
        return image
    }
    
    func setData(_ data: BannerCellData) {
        bannerImageView.image = convertBase64StringToImage(imageBase64String: data.bannerImage)
//        bannerImageView.kf.setImage(with:  URL(string: data.bannerImage ?? ""), placeholder: UIImage(named: "event"))
    }
}
