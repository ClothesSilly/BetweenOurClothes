//
//  DetailFilterViewModel.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/14.
//

import Foundation

class DetailFilterViewModel {
    
    let model = DetailFilterModel()
    
    var numberOfCategory: Int {
        return model.filteringCategory.count
    }
    
    var numberOfLengthFilter: Int {
        return model.lengthFilter.count
    }
    
    var numberOfColor: Int {
        return model.colorFilter.count
    }
    
    var numberOfTexture: Int {
        return model.textureFilter.count
    }
    
    var numberOfFit: Int {
        return model.fitFilter.count
    }
    
    var colorSelectedIndex: Int?
    var fitSelectedIndex: Int?
    var textureSelectedIndex: Int?
    var legnthSelectedIndex: Int?
    
    
    func numberOf(sectionIn section: Int) -> Int {
        if section == 0 {
            return numberOfColor
        } else if section == 1{
            return numberOfFit
        } else if section == 2{
            return numberOfLengthFilter
        } else {
            return numberOfTexture
        }
    }
    
    
    func headerTextIn(section : Int) -> String {
        if section == 0 {
            return "색감"
        } else if section == 1 {
            return "핏"
        } else if section == 2 {
            return "길이"
        } else {
            return "질감"
        }
    }
    
    func filterSelectionAt(indexPath: IndexPath ) {
        if indexPath.section == 0 {
            colorSelectedIndex = indexPath.row
        } else if indexPath.section == 1 {
            fitSelectedIndex = indexPath.row
        } else if indexPath.section == 2 {
            legnthSelectedIndex = indexPath.row
        } else if indexPath.section == 3 {
            textureSelectedIndex = indexPath.row
        }
    }
    
    

    
    
}

class DetailFilterModel {
    
    let filteringCategory = ["기장", "색상", "소재", "핏"]
    
    let lengthFilter = ["김", "짧음", "중간"]
    let colorFilter = ["빨", "주", "노", "초", "파", "남", "보"]
    let textureFilter = ["실", "면", "케시미어"]
    let fitFilter = ["딱", "루즈", "펑키"]
    
    
}
