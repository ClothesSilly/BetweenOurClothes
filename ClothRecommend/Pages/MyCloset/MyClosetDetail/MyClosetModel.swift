//
//  MyClosetModel.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/28.
//

import UIKit


protocol ClosetModel {
    var modelImage: UIImage { get }
    var numberOfMiddleCategory: Int {get}
    var categoryNames: [String] {get}
}


class MyClosetPants: ClosetModel {
    var modelImage: UIImage {
        return UIImage(named: "lower")!
    }
    
    var numberOfMiddleCategory: Int {
        return categoryNames.count
    }
    
    // 상위 -
    //. "아우터",
    
    var categoryNames = ["청바지", "팬츠", "스커트", "레깅스", "조거팬츠"]
}

class MyClosetUpper: ClosetModel {
    var modelImage: UIImage {
        return UIImage(named: "upper")!
    }
    
    var numberOfMiddleCategory: Int {
        return categoryNames.count
    }
    
    var categoryNames = ["탑", "블라우스", "티셔츠", "니트웨어", "셔츠", "브라탑", "후드티"]
}

class MySweater: ClosetModel {
    var modelImage: UIImage {
        return UIImage(named: "upper")!
    }
    
    var numberOfMiddleCategory: Int {
        return categoryNames.count
    }
    
    var categoryNames = ["코트", "재킷", "점퍼", "패딩", "가디건", "집업"]
}
