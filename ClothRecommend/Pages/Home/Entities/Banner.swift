//
//  Banner.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/25.
//

import Foundation

struct Banner: Decodable {
    let bannerImages: [BannerImage]
    
    enum CodingKeys: String, CodingKey {
        case bannerImages = "images"
    }
}


struct BannerImage: Decodable {
    let image: String?
   
    enum CodingKeys: String, CodingKey {
        case image = "image"
    }
    
    //얘는 안써줘도 기본적으로 실행이되는 내용이지만, datetime에 대하여 custom해줘야하기 때문에 작성해준 것임
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.title = try? values.decode(String?.self, forKey: .title)
//
//    }
}
