//
//  Book.swift
//  BookReview
//
//  Created by yongcheol Lee on 2022/01/16.
//

import Foundation

struct Book: Decodable {
    let title: String
    private let image: String?
    
    var imageURL: URL? { URL(string: image ?? "") }
    
    init(title: String, image: String?) {
        self.title = title
        self.image = image
    }
}
