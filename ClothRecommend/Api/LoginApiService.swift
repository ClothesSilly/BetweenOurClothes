//
//  LoginApiService.swift
//  ClothRecommend
//
//  Created by USER on 2022/11/02.
//

import UIKit

import Alamofire

class LoginApiService {
    
    static func refreshToken(completion: @escaping (String) -> Void) {
        AF.request(ApiUrls.refreshToken.rawValue, method: .post).responseData { response in
            switch response.result {
            case .success(_):
                guard let statusCode = response.response?.statusCode else { return }
                if statusCode == 200 {
                    completion("token need to be passsed")
                } else {
                  print("refresh failed")
                }
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    
    static func login(email: String, password: String, completion: @escaping (String) -> Void) {

        var request = URLRequest(url: ApiUrls.login.url)
          
        let json: [String: String] = [
            "email": email,
            "password": password
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
             request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let d = try! JSONDecoder().decode(LoginInfo.self, from: data)
            print(d.accessToken)
            completion(d.accessToken)
            
          }
          task.resume()

    }
    
    static func convertFormField(named name: String, value: String, using boundary: String) -> String {
      var fieldString = "--\(boundary)\r\n"
      fieldString += "Content-Disposition: form-data; name=\"\(name)\"\r\n"
      fieldString += "\r\n"
      fieldString += "\(value)\r\n"

      return fieldString
    }
    


    static func register(email: String, password: String, name: String, nickname: String, phone: String, thumnail: UIImage?, completion: @escaping (String) -> Void) {
        

        let header : HTTPHeaders = [
            "Content-Type" : "multipart/form-data",
            "Accept": "application/json",
            "Content-Type" : "application/json"
        ]
        
        let parameters: [String : String] = [
            "email": email,
            "password": password,
            "name": name,
            "nickname": nickname,
            "phone": phone
        ]
        
        
        let encoder = JSONEncoder()
        let c = try! encoder.encode(parameters)
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(c, withName: "data", mimeType: "application/json")
            
                if let image = thumnail?.pngData() {
                    multipartFormData.append(image, withName: "image", fileName: "\(image).png", mimeType: "image/png")
                }
        }, to: ApiUrls.register.url, method: .post, headers: header).response { response in

                guard let statusCode = response.response?.statusCode,
                      statusCode == 200
                else { return }
            
                completion("200")
            
            }
        }
        
    static func verifyEmailCode(code: String, email: String, completion: @escaping (String) -> Void) {
                

        var request = URLRequest(url: ApiUrls.confirmEmailVerification.url)
          
        let json: [String: Any] = [
            "email": email,
            "code": code
        ]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
             request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        print("checking")
        print(request.headers)
        print("checking")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            print(response)
          }
          task.resume()
    }
    
    
    static func getEmailCode(email: String, completion: @escaping (String) -> Void) {
        
        var request = URLRequest(url: ApiUrls.sendEmailVerification.url)
          
        let json: [String: Any] = [
            "email": email,
        ]
              
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
             request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = jsonData
    
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            completion("200")
        }
        task.resume()

    }

}
    
    


extension NSMutableData {
  func appendString(_ string: String) {
    if let data = string.data(using: .utf8) {
      self.append(data)
    }
  }
}


// MARK: - LoginInfo
struct LoginInfo: Codable {
    let accessToken, grantType, image, nickname: String
    let refreshToken: String
}
