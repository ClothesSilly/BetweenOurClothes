//
//  SearchResult.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/12/01.
//

import Foundation

struct SearchResult: Decodable {
    let content: [SearchResultData]
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
    }
}

struct SearchResultData: Decodable {
    let content: String?
    let id: Int?
    let image: String?
    let modifiedDate: String?
    let price: String?
    let title: String?
    let transport: String?
    
   
    enum CodingKeys: String, CodingKey {
        case content, id, image, price, title, transport
        case modifiedDate = "modified_date"
    }
    
    //
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.content = try? values.decode(String?.self, forKey: .content)
        self.id = try? values.decode(Int?.self, forKey: .id)
        self.image = try? values.decode(String?.self, forKey: .image)
        self.modifiedDate = try? values.decode(String?.self, forKey: .modifiedDate)
        self.price = try? values.decode(String?.self, forKey: .price)
        self.title = try? values.decode(String?.self, forKey: .title)
        self.transport = try? values.decode(String?.self, forKey: .transport)
        
    }
}
    
