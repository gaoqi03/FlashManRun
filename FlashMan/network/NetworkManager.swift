//
//  NetworkManager.swift
//  FlashMan
//
//  Created by 高琪 on 2024/8/11.
//

import Foundation
class NetworkManager {
    
    private init(){
        
    }
    
    static var instance:NetworkManager={
        let network = NetworkManager()
        return network
    }()
    
    func makeRequest(){
        guard let url = URL(string: "https://api.example.com/data") else { return }
        
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        
        // 添加请求 header
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer your_access_token", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            
            if let error = error {
                return
            }
            
            // 检查响应并处理 HTTP 状态码
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)")
                
                switch httpResponse.statusCode {
                case 200...299:
                    // 请求成功，处理响应数据
                    if let data = data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: data, options: [])
                            print("Response JSON: \(json)")
                        } catch {
                            print("JSON parsing error: \(error)")
                        }
                    } else {
                        print("No data received")
                    }
                case 400...499:
                    // 客户端错误（如 400 Bad Request, 401 Unauthorized）
                    print("Client error: \(httpResponse.statusCode)")
                case 500...599:
                    // 服务器错误（如 500 Internal Server Error）
                    print("Server error: \(httpResponse.statusCode)")
                default:
                    // 处理其他状态码
                    print("Unexpected HTTP status code: \(httpResponse.statusCode)")
                }
            } else {
                print("Invalid response")
            }
            
        }
        
        
    }
  static  let jsonString = """
    {
      "name": "John Doe",
      "age": 30,
      "email": "john.doe@example.com",
      "address": {
        "street": "123 Main St",
        "city": "Anytown",
        "zipCode": "12345"
      }
    }
    """
    func fetchData(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            // 检查响应并处理 HTTP 状态码
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)")
                
                switch httpResponse.statusCode {
                case 200...299:
                    // 请求成功，处理响应数据
                    if let data =  NetworkManager.jsonString.data(using: .utf8) {
                        let decoder = JSONDecoder()
                        
                        do {
                            let jsonResult = try JSONSerialization.jsonObject(with: data, options: [])
                            
                            let person = try decoder.decode(Person.self, from: jsonResult as! Data)
                            
                        } catch {
                            print("JSON parsing error: \(error)")
                        }
                    } else {
                        print("No data received")
                    }
                case 400...499:
                    // 客户端错误（如 400 Bad Request, 401 Unauthorized）
                    print("Client error: \(httpResponse.statusCode)")
                case 500...599:
                    // 服务器错误（如 500 Internal Server Error）
                    print("Server error: \(httpResponse.statusCode)")
                default:
                    // 处理其他状态码
                    print("Unexpected HTTP status code: \(httpResponse.statusCode)")
                }
            } else {
                print("Invalid response")
            }
        }
        
        task.resume()
    }
    
    
}
