//
//  SearchResultCellData.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/30.
//

import Foundation


//게시글에 필요한 것들
//DB설계도 참고하여 만듦
struct SearchResultCellData {
    let id: Int?
    let content: String?
    let image: String?
    let modifiedDate: String?
    let price: String?
    let title: String?
    let transport: String?
}
