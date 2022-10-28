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
    
    var categoryNames = ["슬렉스", "면바지", "청바지", "펑키바지"]
}

class MyClosetUpper: ClosetModel {
    var modelImage: UIImage {
        return UIImage(named: "upper")!
    }
    
    var numberOfMiddleCategory: Int {
        return categoryNames.count
    }
    
    var categoryNames = ["반팔", "긴팔", "양옷", "한복"]
}

class MySweater: ClosetModel {
    var modelImage: UIImage {
        return UIImage(named: "upper")!
    }
    
    var numberOfMiddleCategory: Int {
        return categoryNames.count
    }
    
    var categoryNames = ["노란 스웨터", "갈색 스웨터", "빨간 스웨터"]
}
