//
//  SearchBookPresenterTests.swift
//  BookReviewTests
//
//  Created by yongcheol Lee on 2022/01/17.
//

import XCTest
@testable import BookReview

class SearchBookPresenterTests: XCTestCase {
    
    
    var sut: SearchBookPresenter!
    var viewController: MockSearchBookViewController!
    var booksearchManager: MockBookSearchManager!
    var searchBookDelegate: MockSearchBookDelegateClass!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockSearchBookViewController()
        booksearchManager = MockBookSearchManager()
        searchBookDelegate = MockSearchBookDelegateClass()
        
        sut = SearchBookPresenter(
            viewController: viewController,
            delegate: searchBookDelegate,
            booksearchManager: booksearchManager
        )
    }
    
    override func tearDown() {
        viewController = nil
        booksearchManager = nil
        
        super.tearDown()
    }
    
    func test_WhenCalled_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_WhenCalled_SearchBarSearchButtonClicked() {
        let searchBar = UISearchBar()
        searchBar.text = "TMP"
        
        sut.searchBarSearchButtonClicked(searchBar)
        
        XCTAssertTrue(viewController.isCalledReloadTableView)
    }
}

final class MockSearchBookDelegateClass: SearchBookDelegate {
    func selectBook(_ book: Book) {
        return
    }
}

final class MockBookSearchManager: BookSearchManagerProtocol {
    
    func request(from keyword: String, completionHandler: @escaping (([Book]) -> Void)) {
        var mockData = [Book(
            title: "나의 첫 <b>주식</b> 교과서 (강방천&존리와 함께하는)",
            image: "https://bookthumb-phinf.pstatic.net/cover/207/483/20748325.jpg?type=m1&udate=20211217"
        ), Book(
            title: "이 책을 <b>주식</b>투자 시작전에 봤더라면 (주린이들이 3년의 시간을 날리지 않을 <b>주식</b> 투자법)",
            image: "https://bookthumb-phinf.pstatic.net/cover/209/538/20953812.jpg?type=m1&udate=20211014"
        )]
        
        completionHandler(mockData)
    }
}


