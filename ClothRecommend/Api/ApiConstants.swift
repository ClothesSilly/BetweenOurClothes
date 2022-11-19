//
//  ApiConstants.swift
//  ClothRecommend
//
//  Created by USER on 2022/11/02.
//

import Foundation

extension URL {
    static let baseUrl = "http://43.201.140.61:55607"
    
    static func makeEndPoint(_ endPoint: String) -> URL {
        return URL(string: URL.baseUrl + endPoint)!
    }
}

extension String {
    static let baseUrl = "http://43.201.140.61:55607"
    
    static func makeEndPoint(_ endPoint: String) -> String {
        return URL.baseUrl + endPoint
    }
}
    

enum ApiUrls: String {

    // Login Api
    case sendEmailVerification
    case confirmEmailVerification
    case register
    case login
    case refreshToken
    

    // MyCloth Api
    // find, delete, fix api 같음. 메서드만 변경.
    case uploadCloth
    case findCloth
    case filterCloth
    
    var url: URL {
        switch self {
        case.sendEmailVerification:
            return .makeEndPoint("/api/v1/auth/sign-up/email")
        case .confirmEmailVerification:
            return .makeEndPoint("/api/v1/auth/sign-up/code")
        case .register:
            return .makeEndPoint("/api/v1/auth/sign-up")
        case .login:
            return .makeEndPoint("/api/v1/auth/login")
        case .refreshToken:
            return .makeEndPoint("/api/v1/auth/issue")
            
            
            //
        case .uploadCloth:
            return .makeEndPoint("/api/v1/closets/post")
        case .findCloth:
            return .makeEndPoint("/api/v1/closets/post")
        case .filterCloth:
            return .makeEndPoint("/api/v1/closets/post/category")
        }
    }
    
    
    var urlString: String {
        switch self {
        case.sendEmailVerification:
            return .makeEndPoint("/api/v1/auth/sign-up/email")
        case .confirmEmailVerification:
            return .makeEndPoint("/api/v1/auth/sign-up/code")
        case .register:
            return .makeEndPoint("/api/v1/auth/sign-up")
        case .login:
            return .makeEndPoint("/api/v1/auth/login")
        case .refreshToken:
            return .makeEndPoint("/api/v1/auth/issue")
            
            
            //
        case .uploadCloth:
            return .makeEndPoint("/api/v1/closets/post")
        case .findCloth:
            return .makeEndPoint("/api/v1/closets/post")
        case .filterCloth:
            return .makeEndPoint("/api/v1/closets/post/category")
        }
    }

}
