//
//  MyClosetViewModel.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/16.
//

import UIKit

class MyClosetViewModel {
    
    var filterColor: String?
    var filterFit: String?
    var filterLength: String?
    var filterTexture: String?
    
    
    var upperModel = MyClosetUpper()
    var lowerModel = MyClosetPants()
    var sweaterModel = MySweater()
    var onePiModel = MyClosetOnePi()
    
    var selectedFilter: ClosetModel
    var selectedMiddleFilter = 0
    
    init() {
        selectedFilter = upperModel
    }
    
    func setBigCategoryImageAt(indexPath: IndexPath) -> UIImage {
        if indexPath.row == 0 {
            return upperModel.modelImage
        } else if indexPath.row == 1 {
            return lowerModel.modelImage
        } else if indexPath.row == 2{
            return UIImage(named: "out")!
        } else {
            return UIImage(named: "onepi")!
        }
    }
    
    func bigCategoryNameAt(indexPath: IndexPath) -> String {
        if indexPath.row == 0 {
            return "상의"
        } else if indexPath.row == 1 {
            return "하의"
        } else if indexPath.row == 2 {
            return "아웃터"
        } else {
            return "원피스"
        }
    }
    
    func middleCategoryNameAt(big: Int, indexPath: Int) -> String {
        
        if big == 0 {
            return MyClosetUpper().categoryNames[indexPath]
        } else if big == 1{
            return MyClosetPants().categoryNames[indexPath]
        } else if big == 2{
            return MySweater().categoryNames[indexPath]
        } else {
            return MyClosetOnePi().categoryNames[indexPath]
        }
        
    }
    
    func cellForItemAt(indexPath: IndexPath) -> String {
        return selectedFilter.categoryNames[indexPath.row]
    }
    
    func selectFilterAt(indexPath: IndexPath) {
        if indexPath.row == 0 {
            selectedFilter = upperModel
        } else if indexPath.row == 1 {
            selectedFilter = lowerModel
        } else if indexPath.row == 2 {
            selectedFilter = sweaterModel
        } else {
            selectedFilter = onePiModel
        }
    }
    
    var numberOfMiddleFilters: Int {
        return selectedFilter.numberOfMiddleCategory
    }
}
