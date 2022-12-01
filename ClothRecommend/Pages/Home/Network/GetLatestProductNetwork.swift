//
//  GetLatestProductNetwork.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/12/02.
//
import Foundation
import RxSwift

enum GetLatestProductNetworkError: Error {
    case invalidURL
    case invalidJSON
    case networkError
}

class GetLatestProductNetwork {
    private let session: URLSession
    let api = GetLatestProductAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getLatestProduct() -> Single<Result<[HomePreviewData], SearchNetworkError>> {
        //URLComponents로부터 url을 얻어낸다.
        guard let url = URL(string: api.getapi()) else {
            return .just(.failure(.invalidURL))
        }
        print("URL = ", url)
        let ud = UserDefaults.standard
        let acstoken = ud.value(forKey: "userToken")!
        
        //Request생성
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(acstoken as? String, forHTTPHeaderField: "Authorization")
        
        return  session.rx.data(request: request as URLRequest)
            .map { data in
                do {
                    //요청으로 받아온 응답ㅇ르 우리가 만들어놓은 DKBlog entity형태에 맞게 decode함
                    let homePreviewData = try JSONDecoder().decode([HomePreviewData].self, from: data)
                    return .success(homePreviewData)
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
