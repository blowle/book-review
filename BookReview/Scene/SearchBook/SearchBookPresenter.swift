//
//  SearchBookPresenter.swift
//  BookReview
//
//  Created by yongcheol Lee on 2022/01/16.
//

import UIKit

protocol SearchBookProtocol {
    func setupViews()
    func dismiss()
    func reloadTableView()
}

protocol SearchBookDelegate {
    func selectBook(_ book: Book)
}

final class SearchBookPresenter: NSObject {
    private let viewController: SearchBookProtocol
    private let booksearchManager = BookSearchManager()
    private let delegate: SearchBookDelegate
    
    private var books: [Book] = []
    
    init(viewController: SearchBookProtocol,
         delegate: SearchBookDelegate
    ) {
        self.viewController = viewController
        self.delegate = delegate
    }
    
    func viewDidLoad() {
        viewController.setupViews()
    }
}

extension SearchBookPresenter: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        
        booksearchManager.request(from: text) { [weak self] books in
            self?.books = books
            self?.viewController.reloadTableView()
        }
    }
}

extension SearchBookPresenter: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let book = books[indexPath.row]
        cell.textLabel?.text = "\(book.title)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBook = books[indexPath.row]
        delegate.selectBook(selectedBook)
        viewController.dismiss()
    }
}
