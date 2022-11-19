//
//  MyClothetApiService.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/27.
//

import UIKit
import Alamofire


class MyClothetApiService {
    
    
    static func uploadMyCloth(images: [UIImage], completion: @escaping (String) -> Void) {
        
        let token = UserDefaults.standard.string(forKey:  "userToken")!
        let url = URL(string: ApiUrls.uploadCloth.urlString)!
        let header : HTTPHeaders = [
            "Content-Type" : "multipart/form-data",
            "Accept": "application/json",
            "Content-Type" : "application/json",
            "Authorization" : token
        ]
        
        let params = [
          "style":"모던",
          "large_category":"하의",
          "small_category":"청바지",
          "fit":"스키니",
          "length":"니렝스",
          "color":"블랙",
          "material":"퍼"
        ]
        
        let encoder = JSONEncoder()
        let c = try! encoder.encode(params)
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(c, withName: "data", mimeType: "application/json")
            
            for image in images {
                
                if let image = image.pngData() {
                    multipartFormData.append(image, withName: "image", fileName: "\(image).png", mimeType: "image/png")
                }
            }
            
        }, to: url, method: .post, headers: header).response { response in
            
            print(response.response)
            print(response.response?.statusCode)
            let a = response.response?.statusCode
                
            if let code = response.response?.statusCode, code == 200 {
                print(code, "From this")
                completion("\(code)")
            }
            }
    }
    
    static func findCloth(id: Int, completion: @escaping (MyClothesDetailData) -> Void) {
        
        let token = UserDefaults.standard.string(forKey:  "userToken")!
        let url = ApiUrls.findCloth.urlString + "/" + String(id)
        let url2 = URL(string: url)!
        var request = URLRequest(url: url2)
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        print(token)
        request.httpMethod = "GET"
        
        

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
      
        
            let d = try! JSONDecoder().decode(MyClothesDetailData.self, from: data)
            completion(d)
    
          }
          task.resume()
        
        
    
  
    }
    
    static func deleteCloth(id: Int) {
        AF.request(ApiUrls.findCloth.rawValue + String(id), method: .delete).responseData { response in
            switch response.result {
            case .success(_):
                guard let statusCode = response.response?.statusCode else { return }
                if statusCode == 200 {
//                    completion("token need to be passsed")
                } else {
                  print("refresh failed")
                }
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    static func fixCloth(id: Int) {
        AF.request(ApiUrls.findCloth.rawValue + String(id), method: .patch).responseData { response in
            switch response.result {
            case .success(_):
                guard let statusCode = response.response?.statusCode else { return }
                if statusCode == 200 {
//                    completion("token need to be passsed")
                } else {
                  print("refresh failed")
                }
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    static func filterClothes(nameL: String?, nameS: String?, color: String?, fit: String?, length: String?, style: String?, completion: @escaping (MyClothesData) -> Void) {
        
        
        let token = UserDefaults.standard.string(forKey:  "userToken")!
        var request = URLRequest(url: ApiUrls.filterCloth.url)
          
        let json: [String: Any?] = [
            "color": color ?? nil,
            "fit": fit ?? nil,
            "length": length ?? nil,
            "material": style ?? nil,
            "nameL": nameL ?? nil,
            "nameS": nameS ?? nil
        ]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "Authorization")
             
        request.httpMethod = "POST"
        request.httpBody = jsonData
        

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
       
        
            let d = try! JSONDecoder().decode(MyClothesData.self, from: data)
            completion(d)

          }
          task.resume()


    }

}
