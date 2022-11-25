//
//  GetBannerAPI.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/25.
//

import Foundation


// query만 바뀌는 데 맞춰 새로원 URLComponents를 return해주면 되므로 아래와 같은 설계
struct GetBannerAPI {
    static let scheme = "http"
    static let host = "43.201.140.61:55607"
    static let path = "/api/v1/main/banner"
    
    func getBanner() -> URLComponents {
        var components = URLComponents()
        components.scheme = SearchBlogAPI.scheme
        components.host = SearchBlogAPI.host
        components.path = SearchBlogAPI.path
        
//        components.queryItems = [
//            URLQueryItem(name: "query", value: query)
//        ]
        
        return components
    }
}
