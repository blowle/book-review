//
//  BookReview.swift
//  BookReview
//
//  Created by yongcheol Lee on 2022/01/17.
//

import Foundation

struct BookReview: Codable {
    let title: String
    let contents: String
    let imageURL: URL?
}
