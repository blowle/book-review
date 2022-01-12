//
//  BookReviewPresenter.swift
//  BookReview
//
//  Created by yongcheol Lee on 2022/01/12.
//

import UIKit

protocol BookReviewProtocol {
    func setupNavigationBar()
    func setupViews()
}

final class BookReviewPresenter: NSObject {
    private let viewController: BookReviewViewController
    
    init(viewController: BookReviewViewController) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
}

extension BookReviewPresenter: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = "\(indexPath)"
        
        return cell
    }
}
