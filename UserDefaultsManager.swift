//
//  UserDefaultsManager.swift
//  BookReview
//
//  Created by yongcheol Lee on 2022/01/17.
//

import Foundation

protocol UserDefaultsManagerProtocol {
    func getReviews() -> [BookReview]
    func setReview(_ newValue: BookReview)
}

struct UserDefaultsManager: UserDefaultsManagerProtocol {
    enum Key: String {
        case review
    }
    
    func getReviews() -> [BookReview] {
        guard let data = UserDefaults.standard.data(forKey: Key.review.rawValue) else { return [] }
        
        return (try? PropertyListDecoder().decode([BookReview].self, from: data)) ?? []
    }
    
    func setReview(_ newValue: BookReview) {
        var currentReviews = getReviews()
        currentReviews.insert(newValue, at: 0)
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(currentReviews), forKey: Key.review.rawValue)
    }   
}
