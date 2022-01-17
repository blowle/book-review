//
//  MockReviewWriteViewController.swift
//  BookReviewTests
//
//  Created by yongcheol Lee on 2022/01/17.
//

import Foundation

@testable import BookReview

final class MockReviewWriteViewController: ReviewWriteProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledSetupViews = false
    var isCalledShowCloseAlertSheet = false
    var isCalledClose = false
    var isCalledPresentToSearchBookViewController = false
    var isCalledUpdateViews = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func showCloseAlertSheet() {
        isCalledShowCloseAlertSheet = true
    }
    
    func close() {
        isCalledClose = true
    }
    
    func presentToSearchBookViewController() {
        isCalledPresentToSearchBookViewController = true
    }
    
    func updateViews(title: String, imageURL: URL?) {
        isCalledUpdateViews = true
    }
}
