//
//  HomePreview.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/12/02.
//

import Foundation

struct HomePreview: Decodable {
    let homePreviewDatas: [HomePreviewData]
    
    enum CodingKeys: String, CodingKey {
        case homePreviewDatas = "datas"
    }
}


struct HomePreviewData: Decodable {
    let commentsCount: Int?
    let id: Int?
    let image: String?
    let likeCount: Int?
    let title: String?
   
    enum CodingKeys: String, CodingKey {
        case id, image, title
        case commentsCount = "comments_cnt"
        case likeCount = "likes_cnt"
    }
    
}
