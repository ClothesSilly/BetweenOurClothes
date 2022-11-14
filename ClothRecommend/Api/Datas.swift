//
//  Datas.swift
//  ClothRecommend
//
//  Created by USER on 2022/11/14.
//

import Foundation

// MARK: - MyClothesData
struct MyClothesData: Codable {
    let content: [Content]
    let pageable: Pageable
    let totalPages, totalElements: Int
    let last, first: Bool
    let sort: Sort
    let numberOfElements, size, number: Int
    let empty: Bool
}

// MARK: - Content
struct Content: Codable {
    let image: String
    let id: Int
}

// MARK: - Pageable
struct Pageable: Codable {
    let sort: Sort
    let pageSize, pageNumber, offset: Int
    let paged, unpaged: Bool
}

// MARK: - Sort
struct Sort: Codable {
    let sorted, unsorted, empty: Bool
}
