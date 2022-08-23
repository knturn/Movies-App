//
//  DetailViewController.swift
//  Movies App
//
//  Created by Kaan Turan on 23.08.2022.
//

import UIKit

class DetailViewController: UIViewController {
    var movieName: String?
    var movieDetail: String?
    // MARK: UIELEMENTS
    var scrollView: UIScrollView = UIScrollView()
    var contentView: UIView = UIView()
    
    private lazy var movieTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = movieName?.uppercased()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.backgroundColor = .lightText
        return label
    }()
    
    private lazy var detail: UILabel = {
        let detail = UILabel()
        detail.backgroundColor = .lightText
        detail.text = movieDetail
        detail.numberOfLines = 0
        detail.font = UIFont.systemFont(ofSize: 18, weight: .light)
        detail.textColor = .red
        return detail
    }()
    
    // MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        adSubview()
        makeConstraint()
        scrollView.alwaysBounceVertical = true
    }
    // MARK: FUNCS
    func adSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(movieTitle)
        contentView.addSubview(detail)
    }
    
    func makeConstraint() {
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-80)
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.right.equalTo(view.snp.right).offset(-5)
            make.left.equalTo(view.snp.left).offset(5)
        }
        
        movieTitle.snp.makeConstraints { make in
            make.top.lessThanOrEqualToSuperview().offset(100)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        detail.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottom).offset(50)
            make.right.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(5)
            
        }
    }
}
// MARK: EXTENSIONS
