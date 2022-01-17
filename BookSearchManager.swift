//
//  BookSearchManager.swift
//  BookReview
//
//  Created by yongcheol Lee on 2022/01/16.
//

import Foundation
import Alamofire

protocol BookSearchManagerProtocol {
    func request(from keyword: String, completionHandler: @escaping (([Book]) -> Void))
}

struct BookSearchManager: BookSearchManagerProtocol {
    func request(from keyword: String, completionHandler: @escaping ([Book]) -> Void ) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return }
        
        let parameters = BookSearchRequestModel(query: keyword)
        
        let headers: HTTPHeaders = [
            NaverKey.clientIdKey: NaverKey.clientIdValue,
            NaverKey.clientSecretKey: NaverKey.clientSecretValue
        ]
        
        AF
            .request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: BookSearchResponseModel.self) { response in
                switch response.result {
                case .success(let data):
                    completionHandler(data.items)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
}
