//
//  MockUserDefaultsManager.swift
//  BookReviewTests
//
//  Created by yongcheol Lee on 2022/01/17.
//

import Foundation

@testable import BookReview

final class MockUserDefaultsManager: UserDefaultsManagerProtocol {
    var isCalledGetReviews = false
    var isCalledSetReviews = false
    func getReviews() -> [BookReview] {
        isCalledGetReviews = true
        
        return []
    }
    
    func setReview(_ newValue: BookReview) {
        isCalledSetReviews = true
    }
}

