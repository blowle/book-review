//
//  BookSearchResponseModel.swift
//  BookReview
//
//  Created by yongcheol Lee on 2022/01/16.
//

import Foundation

struct BookSearchResponseModel: Decodable {
    var items: [Book] = []
}
