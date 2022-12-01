//
//  HomePreviewCellData.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/12/02.
//

import Foundation


//게시글에 필요한 것들
//DB설계도 참고하여 만듦
struct HomePreviewCellData {
    let commentsCount: Int?
    let id: Int?
    let image: String?
    let likeCount: Int?
    let title: String?
}
