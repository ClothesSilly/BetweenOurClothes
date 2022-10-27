//
//  MyClothetApiService.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/27.
//

import Foundation
import Alamofire



enum APIError: Error {
    case firebaseTokenError(errorContent: String)
    case serverError(errorContent: String)
    case clientError(errorContent: String)
    case alreadyWithdrawl(errorContent: String)
}

class MyClothetApiService {
    
    static func updateFcm(idToken: String, fcmToken: String, completion: @escaping (APIError?, Int) -> Void) {
        
        let headers: HTTPHeaders = ["idtoken": idToken]
        let p: Parameters = [
            "FCMtoken": fcmToken
        ]
            
        AF.request(EndPoint.update_fcm_token.url, method: .get, parameters: p, headers: headers).responseData { response in
            switch response.result {
            case .success(_):
                guard let statusCode = response.response?.statusCode else { return }
                if statusCode == 200 {
                    completion(nil, 200)
                }else {
                    handleErrorCodes(statusCode: statusCode, completion: completion)
                }
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    static func getUserInfo(idToken: String, completion: @escaping (APIError?, Int) -> Void) {
        
            let headers: HTTPHeaders = ["idtoken": idToken]
        
            AF.request(EndPoint.getUserInfo.url, method: .get, headers: headers).responseData { response in
                switch response.result {
                case .success(let value):
                    guard let statusCode = response.response?.statusCode else { return }
                    if statusCode == 200 {
                        let decoder = JSONDecoder()
                        do {
                            let result = try decoder.decode(User.self, from: value)
                            if let fcm = UserDefaults.standard.string(forKey: UserDefaults.myKey.fcmToken.rawValue) {
                                if result.FCMtoken != fcm {
                                    ApiService.updateFcm(idToken: idToken, fcmToken: fcm, completion: completion)
                                }
                                UserInfo.current.user = result
                                UserInfo.current.user?.FCMtoken = fcm
                            }
                        }catch {
                            print("user info decoding error : ", error)
                        }
                        completion(nil, 200)
                    }else if statusCode == 201 {
                        print("need  to make account")
                        completion(nil, 201)
                    }else {
                        handleErrorCodes(statusCode: statusCode, completion: completion)
                    }
                case .failure(let error):
                    print("error", error)
                }
            }
        }

}
