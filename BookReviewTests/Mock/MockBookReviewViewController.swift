//
//  MockBookReviewViewController.swift
//  BookReviewTests
//
//  Created by yongcheol Lee on 2022/01/17.
//

import Foundation

@testable import BookReview

final class MockBookReviewViewController: BookReviewProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledSetupViews = false
    var isCalledPresentToReviewWriteViewController = false
    var isCalledReloadTableView = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func presentToReviewWriteViewController() {
        isCalledPresentToReviewWriteViewController = true
    }
    
    func reloadTableView() {
        isCalledReloadTableView = true
    }
}
