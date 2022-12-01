//
//  AlertActionConvertible.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/31.
//

import UIKit

protocol AlertActionConvertible {
    var title: String {get}
    var style: UIAlertAction.Style {get}
}
