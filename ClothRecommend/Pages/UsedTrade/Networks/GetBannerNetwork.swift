//
//  GetBannerNetwork.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/25.
//

import Foundation
import RxSwift

enum GetBannerNetworkError: Error {
    case invalidURL
    case invalidJSON
    case networkError
}

class GetBannerNetwork {
    private let session: URLSession
    let api = GetBannerAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getBanner() -> Single<Result<Banner, SearchNetworkError>> {
        //URLComponents로부터 url을 얻어낸다.
        guard let url = api.getBanner().url else {
            return .just(.failure(.invalidURL))
        }
        let ud = UserDefaults.standard
        let acstoken = ud.value(forKey: "userToken")!
        
        //Request생성
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(acstoken as? String, forHTTPHeaderField: "Authorization")
        
        return session.rx.data(request: request as URLRequest)
            .map { data in
                do {
                    //요청으로 받아온 응답ㅇ르 우리가 만들어놓은 DKBlog entity형태에 맞게 decode함
                    let bannerData = try JSONDecoder().decode(Banner.self, from: data)
                    return .success(bannerData)
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
