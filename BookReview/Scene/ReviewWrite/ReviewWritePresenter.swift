//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by yongcheol Lee on 2022/01/13.
//

import Foundation

protocol ReviewWriteProtocol {
    func setupNavigationBar()
    func setupViews()
    func showCloseAlertSheet()
    func close()
    func presentToSearchBookViewController()
    func updateViews(title: String, imageURL: URL?)
}

final class ReviewWritePresenter: NSObject {
    private let viewController: ReviewWriteProtocol
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
//    private var book: Book?
    var book: Book? // to test
    
    let contentsTextViewPlaceHolderText = "내용을 입력해주세요."
    
    init(viewController: ReviewWriteProtocol,
         userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()
    ) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func didTapLeftBarButton() {
        viewController.showCloseAlertSheet()
    }
    
    func didTapRightBarButton(contentText: String?) {
        guard let book = book,
              let contents = contentText,
              contents != contentsTextViewPlaceHolderText
        else { return }
        let bookReview = BookReview(
            title: book.title,
            contents: contents,
            imageURL: book.imageURL
        )
        
        userDefaultsManager.setReview(bookReview)
        viewController.close()
    }
    
    func didTapBookTitleButton() {
        viewController.presentToSearchBookViewController()
    }
}

extension ReviewWritePresenter: SearchBookDelegate {
    func selectBook(_ book: Book) {
        self.book = book
        viewController.updateViews(title: book.title, imageURL: book.imageURL)
    }
}
