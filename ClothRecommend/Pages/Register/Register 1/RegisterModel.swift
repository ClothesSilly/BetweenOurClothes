//
//  RegisterModel.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/22.
//

import Foundation

struct RegisterModel: Codable {
    
    let emailAddress: String
    
    let password: String
    let checkPassword: String
    
    let name: String
    let phoneNumber: String
}


struct VerifyAccount: Codable {
    let verifyCode: String
    
}

