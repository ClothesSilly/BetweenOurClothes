//
//  SearchBlogAPI.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/01.
//


import Foundation

// query만 바뀌는 데 맞춰 새로원 URLComponents를 return해주면 되므로 아래와 같은 설계
struct SearchBlogAPI {
    static let scheme = "https"
    static let host = "dapi.kakao.com"
    static let path = "/v2/search/"
    
    func searchBlog(query: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SearchBlogAPI.scheme
        components.host = SearchBlogAPI.host
        components.path = SearchBlogAPI.path + "blog"
        
        components.queryItems = [
            URLQueryItem(name: "query", value: query)
        ]
        
        return components
    }
}
