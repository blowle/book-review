//
//  ReviewWritePresenterTests.swift
//  BookReviewTests
//
//  Created by yongcheol Lee on 2022/01/17.
//

import XCTest

@testable import BookReview

class ReviewWritePresenterTests: XCTestCase {
    var sut: ReviewWritePresenter!
    var viewController: MockReviewWriteViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockReviewWriteViewController()
        userDefaultsManager = MockUserDefaultsManager()
        
        sut = ReviewWritePresenter(
            viewController: viewController,
            userDefaultsManager: userDefaultsManager
        )
    }
    
    override func tearDown() {
        sut = nil
        
        viewController = nil
        userDefaultsManager = nil
        
        super.tearDown()
    }
    
    func test_whenCalled_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_whenCalled_didTapLeftBarButton() {
        sut.didTapLeftBarButton()
        XCTAssertTrue(viewController.isCalledShowCloseAlertSheet)
    }
    
    func test_whenCalled_didTapRightBarButton_if_existing_book_and_contents() {
        sut.book = Book(title: "How to Test", image: "")
        sut.didTapRightBarButton(contentText: "It is Good for Studying Testable code.")
        
        XCTAssertTrue(userDefaultsManager.isCalledSetReviews)
        XCTAssertTrue(viewController.isCalledClose)
    }
    
    func test_whenCalled_didTapRightBarButton_if_existing_no_book() {
        sut.book = nil
        sut.didTapRightBarButton(contentText: "It is Good for Studying Testable code.")
        
        XCTAssertFalse(userDefaultsManager.isCalledSetReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }
    
    func test_whenCalled_didTapRightBarButton_if_existing_book_and_no_contents() {
        sut.book = Book(title: "How to Test", image: "")
        sut.didTapRightBarButton(contentText: nil)
        
        XCTAssertFalse(userDefaultsManager.isCalledSetReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }
    
    func test_whenCalled_didTapRightBarButton_if_existing_book_and_contents_and_cotents_not_equal_placeholder() {
        sut.book = Book(title: "How to Test", image: "")
        sut.didTapRightBarButton(contentText: sut.contentsTextViewPlaceHolderText)
        
        XCTAssertFalse(userDefaultsManager.isCalledSetReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }

    
    func test_whenCalled_didTapBookTitleButton() {
        sut.didTapBookTitleButton()
        
        XCTAssertTrue(viewController.isCalledPresentToSearchBookViewController)
    }
}


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
