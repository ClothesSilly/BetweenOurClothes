//
//  SearchBlogNetwork.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/01.
//

import Foundation
import RxSwift

enum SearchNetworkError: Error {
    case invalidURL
    case invalidJSON
    case networkError
}

class SearchBlogNetwork {
    private let session: URLSession
    let api = SearchBlogAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func searchBlog(query: String) -> Single<Result<DKBlog, SearchNetworkError>> {
        //URLComponents로부터 url을 얻어낸다.
        guard let url = api.searchBlog(query: query).url else {
            return .just(.failure(.invalidURL))
        }
        
        //Request생성 
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("KakaoAK d6bd69a47948cbb347665cf997c5f45d", forHTTPHeaderField: "Authorization")
        
        return session.rx.data(request: request as URLRequest)
            .map { data in
                do {
                    //요청으로 받아온 응답ㅇ르 우리가 만들어놓은 DKBlog entity형태에 맞게 decode함
                    let blogData = try JSONDecoder().decode(DKBlog.self, from: data)
                    return .success(blogData)
                } catch {
                    return .failure(.invalidJSON)
                }
            }
            .catch{ _ in
                    .just(.failure(.networkError))
            }
            .asSingle()
    }
}
