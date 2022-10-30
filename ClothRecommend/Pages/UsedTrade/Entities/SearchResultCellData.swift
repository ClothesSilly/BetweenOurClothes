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
    let title: String?
    let price: Int?
    let content: String?
    //판매 상태 (판매중..)
    let status: String?
    //거래수단
    let transport: String?
    let datetime: Date?
}
