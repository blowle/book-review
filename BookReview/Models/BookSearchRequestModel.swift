//
//  BookSearchRequestModel.swift
//  BookReview
//
//  Created by yongcheol Lee on 2022/01/16.
//

import Foundation

struct BookSearchRequestModel: Codable {
    /// 검색할 책 키워드
    let query: String
}
