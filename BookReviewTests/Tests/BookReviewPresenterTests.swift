//
//  BookReviewTests.swift
//  BookReviewTests
//
//  Created by yongcheol Lee on 2022/01/12.
//

import XCTest
@testable import BookReview

class BookReviewPresenterTests: XCTestCase {
    var sut: BookReviewPresenter!
    var viewController: MockBookReviewViewController!
    var userDefaultsManager: MockUserDefaultsManager!

    override func setUp() {
        super.setUp()
        
        viewController = MockBookReviewViewController()
        userDefaultsManager = MockUserDefaultsManager()
        sut = BookReviewPresenter(
            viewController: viewController,
            userDefaultsManager: userDefaultsManager
        )
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil

        super.tearDown()
    }
    
    func test_whenCalled_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_whenCalled_didTapRightBarButtonItem() {
        sut.didTapRightBarButtonItem()
        XCTAssertTrue(viewController.isCalledPresentToReviewWriteViewController)
    }
    
    func test_whenCalled_viewWillAppear() {
        sut.viewWillAppear()
        XCTAssertTrue(userDefaultsManager.isCalledGetReviews)
        XCTAssertTrue(viewController.isCalledReloadTableView)
    }
}
