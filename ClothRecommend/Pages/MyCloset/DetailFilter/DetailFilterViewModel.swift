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
    
    var numberOfColor: Int {
        return model.colorFilter.count
    }
 
    
    var numberOfFit: Int {
        return model.fitFilter.count
    }

    var numberOfLengthFilter: Int {
        return model.lengthFilter.count
    }
    
    
    var numberOfTexture: Int {
        return model.styleFilter.count
    }
    
    
    
    var colorSelectedIndex: Int?
    var fitSelectedIndex: Int?
    var textureSelectedIndex: Int?
    var legnthSelectedIndex: Int?
    
    
    func selectedColorName() -> String? {
        if let colorSelectedIndex = colorSelectedIndex {
            return model.colorFilter[colorSelectedIndex]
        }
        return nil
        
    }
    
    func selectedFitName() -> String? {
        if let colorSelectedIndex = fitSelectedIndex {
            return model.fitFilter[colorSelectedIndex]
        }
        return nil
    }
    
    func selectedStyleName() -> String? {
        if let colorSelectedIndex = textureSelectedIndex {
            return model.styleFilter[colorSelectedIndex]
        }
        return nil
    }
    
    func selectedLengthName() -> String? {
        if let colorSelectedIndex = legnthSelectedIndex {
            return model.lengthFilter[colorSelectedIndex]
        }
        return nil
    }
    
    
    
    
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
    
    let filteringCategory = ["기장", "색상", "스타일", "핏"]
    
    let colorFilter = ["블랙", "화이트", "그레이", "레드", "핑크", "오렌지", "베이지", "브라운", "옐로우", "그린", "카키", "민트", "블루", "네이비", "스카이블루", "퍼플", "라벤더", "와인", "네온", "골드" ]
    
    
    let fitFilter = ["타이트", "노멀", "루즈", "오버사이즈"]
    
    let lengthFilter = ["노멀", "크롭", "롱", "미니", "니렝스", "미디", "발목"]
    
    let styleFilter = ["레트로", "로맨틱", "매니시", "모던", "스포티", "아방가르드", "톰보이", "펑크", "힙합", "스트리트", "페미닌"]
    
    
    
}
