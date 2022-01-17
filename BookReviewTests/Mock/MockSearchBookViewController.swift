//
//  MockSearchBookViewController.swift
//  BookReviewTests
//
//  Created by yongcheol Lee on 2022/01/17.
//

import Foundation

@testable import BookReview

final class MockSearchBookViewController: SearchBookProtocol {
    var isCalledSetupViews = false
    var isCalledDismiss = false
    var isCalledReloadTableView = false
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func dismiss() {
        isCalledDismiss = true
    }
    
    func reloadTableView() {
        isCalledReloadTableView = true
    }
}
