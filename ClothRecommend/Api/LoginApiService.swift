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

        
        let url = URL(string: "http://43.201.140.61:8080/api/v1/auth/login")!
        var request = URLRequest(url: url)
          
        let json: [String: String] = [
            "email": email,
            "password": password
        ]
        
        let header : HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type" : "application/json"
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
    
    static func convertFileData(fieldName: String, fileName: String, mimeType: String, fileData: Data, using boundary: String) -> Data {
      let data = NSMutableData()

      // ⭐️ 이미지가 여러 장일 경우 for 문을 이용해 data에 append 해줍니다.
      // (현재는 이미지 파일 한 개를 data에 추가하는 코드)
      data.appendString("--\(boundary)\r\n")
      data.appendString("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"\r\n")
      data.appendString("Content-Type: \(mimeType)\r\n\r\n")
      data.append(fileData)
      data.appendString("\r\n")

      return data as Data
    }

    
    // TODO: need to add photo as parameter
    // https://lena-chamna.netlify.app/post/uploading_array_of_images_using_multipart_form-data_in_swift/
    static func register(email: String, password: String, name: String, nickname: String, phone: String, thumnail: UIImage?, completion: @escaping (String) -> Void) {
        
        
        
        let url = URL(string: "http://43.201.140.61:8080/api/v1/auth/sign-up")!
        
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
        }, to: url, method: .post, headers: header).response { response in

                guard let statusCode = response.response?.statusCode,
                      statusCode == 200
                else { return }
            
                completion("200")
            
            }
        }
        
        

    
    
    
    // 됨
    static func verifyEmailCode(code: String, email: String, completion: @escaping (String) -> Void) {
        
            
        let url = URL(string: "http://43.201.140.61:8080/api/v1/auth/sign-up/code")!
        

        var request = URLRequest(url: url)
          
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
        
        let url = URL(string: "http://43.201.140.61:8080/api/v1/auth/sign-up/email")!
        var request = URLRequest(url: url)
          
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
