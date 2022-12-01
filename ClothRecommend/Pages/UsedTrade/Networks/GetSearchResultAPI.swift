//
//  GetSearchResultAPI.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/12/02.
//

// 검색 결과 keyword를 포함하여 API를 구성하는 코드
import Foundation

// query만 바뀌는 데 맞춰 새로원 URLComponents를 return해주면 되므로 아래와 같은 설계
struct GetSearchResultAPI {
    static let scheme = "http://"
    static let host = "43.201.140.61:55607"
    static let path = "/api/v1/stores/post/category"
    
    func getBanner() -> String {
        var urlStr = GetBannerAPI.scheme + GetBannerAPI.host + GetBannerAPI.path
//        components.scheme = GetBannerAPI.scheme
//        components.host = GetBannerAPI.host
//        components.path = GetBannerAPI.path
        guard let encodedStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return ""}
        
        
//        components.queryItems = [
//            URLQueryItem(name: "query", value: query)
//        ]
        
        return encodedStr
    }
}
