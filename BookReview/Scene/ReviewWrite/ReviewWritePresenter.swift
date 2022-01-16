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
    
    init(viewController: ReviewWriteProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func didTapLeftBarButton() {
        viewController.showCloseAlertSheet()
    }
    
    func didTapRightBarButton() {
        // TODO: UserDefaults에 유저가 작성한 도서리뷰를 저장하기.
        viewController.close()
    }
    
    func didTapBookTitleButton() {
        viewController.presentToSearchBookViewController()
    }
}

extension ReviewWritePresenter: SearchBookDelegate {
    func selectBook(_ book: Book) {
        viewController.updateViews(title: book.title, imageURL: book.imageURL)
    }
}
