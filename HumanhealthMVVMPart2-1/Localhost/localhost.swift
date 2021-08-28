//
//  localhost.swift
//  HumanhealthMVVMPart2-1
//
//  Created by IwasakIYuta on 2021/08/26.
////ここでやることは主に通信関係の整備

import Foundation

enum NetWorkError: Error {
    case decodingError
    case domainError
    case urlError
}

enum HttpMethod: String {

    case get = "GET"
    case post = "POST"

}
struct Resource<T: Codable> {
    var url: URL
    //したはデフォルトの設定
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
}

//extension Resource {
//
//    init(url: URL) {
//
//        self.url = url
//    }
//}
    struct LocalHost {
        
        func load<T>(resource: Resource<T>, completion: @escaping (Result<T,NetWorkError>) -> Void) {
            
//            request.httpMethod = resource.httpMethod.rawValue
//            request.httpBody = resource.body
//            //json　でヘッダーが
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       
            URLSession.shared.dataTask(with: resource.url) { data, response, error in
                guard let data = data,
//                      let response = response as? HTTPURLResponse ,
//                      response.statusCode == 304,
                      error == nil else {
                    
                    completion(.failure(.domainError))
                    return
                    
                }
                print(data)
            
                let patient = try? JSONDecoder().decode(T.self, from: data)
                
               //print(patient)
                if let patient = patient {
                    
                    DispatchQueue.main.async {
                        completion(.success(patient))
                    }
                   
                  
                }
                else {
                print("test")
                    completion(.failure(.decodingError))
                }
            }
            .resume()
    
            
            
        }
        
    }
    
    

