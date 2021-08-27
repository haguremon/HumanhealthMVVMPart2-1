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
    let url: URL
    //したはデフォルトの設定
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
}
extension Resource {
    
    init(url: URL) {
        
        self.url = url
    }
    
}
