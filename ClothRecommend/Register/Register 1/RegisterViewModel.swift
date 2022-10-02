//
//  RegisterViewModel.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/22.
//

import Foundation
import RxSwift
import RxCocoa


class RegisterViewModel {
    
    let tap: PublishRelay<Void> = PublishRelay<Void>()
    
    private let model = BehaviorRelay<RegisterModel>(value: .init(emailAddress: "Asf", password: "ASdf", checkPassword: "ASdf", name: "SAf", phoneNumber: "ADSf"))
    
    var registerUser: PublishSubject<RegisterModel?> = PublishSubject<RegisterModel?>()
    
    var phoneNumber: PublishRelay<String?> = PublishRelay<String?>()
    var name: PublishRelay<String?> = PublishRelay<String?>()
    var emailAddress: PublishRelay<String?> = PublishRelay<String?>()
    var password: PublishRelay<String?> = PublishRelay<String?>()

    
    let disposeBag = DisposeBag()
    
}
