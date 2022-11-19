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
        } else {
            return sweaterModel.modelImage
        }
    }
    
    func bigCategoryNameAt(indexPath: IndexPath) -> String {
        if indexPath.row == 0 {
            return "상의"
        } else if indexPath.row == 1 {
            return "하의"
        } else {
            return "아웃터"
        }
    }
    
    func middleCategoryNameAt(big: Int, indexPath: Int) -> String {
        
        if big == 0 {
            return MyClosetUpper().categoryNames[indexPath]
        } else if big == 1{
            return MyClosetPants().categoryNames[indexPath]
        } else {
            return MySweater().categoryNames[indexPath]
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
        } else {
            selectedFilter = sweaterModel
        }
    }
    
    var numberOfMiddleFilters: Int {
        return selectedFilter.numberOfMiddleCategory
    }
}
