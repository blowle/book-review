//
//  BookReviewPresenter.swift
//  BookReview
//
//  Created by yongcheol Lee on 2022/01/12.
//

import UIKit
import Kingfisher

protocol BookReviewProtocol {
    func setupNavigationBar()
    func setupViews()
    func presentToReviewWriteViewController()
    func reloadTableView()
}

final class BookReviewPresenter: NSObject {
    private let viewController: BookReviewProtocol
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
    private var reviews: [BookReview] = []
    
    init(
        viewController: BookReviewProtocol,
        userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()
    ) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func viewWillAppear() {
        reviews = userDefaultsManager.getReviews()
        viewController.reloadTableView()
    }
    
    func didTapRightBarButtonItem() {
        viewController.presentToReviewWriteViewController()
    }
}

extension BookReviewPresenter: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = reviews[indexPath.row].title
        cell.detailTextLabel?.text = reviews[indexPath.row].contents
        cell.imageView?.kf.setImage(with: reviews[indexPath.row].imageURL) { _ in
            cell.setNeedsLayout()
        }
        
        return cell
    }
}
