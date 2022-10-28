//
//  MyClosetViewModel.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/16.
//

import Foundation

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
