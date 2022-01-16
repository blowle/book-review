//
//  ReviewWriteViewController.swift
//  BookReview
//
//  Created by yongcheol Lee on 2022/01/13.
//

import UIKit
import Kingfisher

final class ReviewWriteViewController: UIViewController {
    private lazy var presenter = ReviewWritePresenter(viewController: self)
    
    private lazy var bookTitleButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("책 제목", for: .normal)
        button.setTitleColor(.tertiaryLabel, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = .systemFont(ofSize: 23.0, weight: .bold)
        
        button.addTarget(self, action: #selector(didTapBookTitleButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var contentsTextView: UITextView = {
        let textView = UITextView()
        
        textView.textColor = .tertiaryLabel
        textView.text = presenter.contentsTextViewPlaceHolderText
        textView.font = .systemFont(ofSize: 16.0, weight: .medium)
        
        textView.delegate = self
        
        return textView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension ReviewWriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .tertiaryLabel else { return }
        
        textView.text = nil
        textView.textColor = .black
    }
}

private extension ReviewWriteViewController {
    @objc func didTapLeftBarButtonItem () {
        presenter.didTapLeftBarButton()
    }
    
    @objc func didTapRightBarButtonItem() {
        presenter.didTapRightBarButton(contentText: contentsTextView.text)
    }
    
    @objc func didTapBookTitleButton() {
        presenter.didTapBookTitleButton()
    }
}

extension ReviewWriteViewController: ReviewWriteProtocol {
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(didTapLeftBarButtonItem)
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(didTapRightBarButtonItem)
        )
    }
    
    func setupViews() {
        [bookTitleButton, contentsTextView, imageView].forEach {
            view.addSubview($0)
        }
        
        bookTitleButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20.0)
        }
        
        contentsTextView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16.0)
            $0.top.equalTo(bookTitleButton.snp.bottom).offset(16.0)
        }
        
        imageView.snp.makeConstraints {
            $0.leading.trailing.equalTo(contentsTextView)
            $0.top.equalTo(contentsTextView.snp.bottom).offset(16.0)
            $0.height.equalTo(200)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func showCloseAlertSheet() {
        let alertController = UIAlertController(
            title: "작성중인 내용이 있습니다. 닫으시겠습니까?",
            message: nil,
            preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: "닫기", style: .destructive, handler: { [weak self] _ in
            self?.dismiss(animated: true)
        })
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        [cancelAction, closeAction].forEach {
            alertController.addAction($0)
        }
        present(alertController, animated: true)
    }
    
    func close() {
        dismiss(animated: true)
    }
    
    func presentToSearchBookViewController() {
        let vc = UINavigationController(rootViewController: SearchBookViewController(searchBookDelegate: presenter))
        
        present(vc, animated: true, completion: nil)
    }
    
    func updateViews(title: String, imageURL: URL?) {
            bookTitleButton.setTitle(title, for: .normal)
            bookTitleButton.setTitleColor(.black, for: .normal)
            imageView.kf.setImage(with: imageURL)
    }
}
