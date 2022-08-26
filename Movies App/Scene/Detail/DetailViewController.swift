//
//  DetailViewController.swift
//  Movies App
//
//  Created by Kaan Turan on 23.08.2022.
//

import UIKit

class DetailViewController: UIViewController {
    private let viewModel: DetailViewModel!
    // MARK: UIELEMENTS
    private lazy var scrollView: UIScrollView = {
        let svie = UIScrollView()
        svie.alwaysBounceVertical = true
        svie.backgroundColor = .clear
        return svie
      }()
    
    init(viewModel: DetailViewModel) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy var poster: UIImageView = {
        let poster = UIImageView()
        poster.backgroundColor = .clear
        poster.contentMode = .scaleAspectFit
        poster.setImage(path: viewModel.getMoviePoster())
        return poster
    }()
    
    private lazy var movieTitle: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = viewModel.getMovieName()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.backgroundColor = .lightText
        return label
    }()
    
    private lazy var detail: UILabel = {
        let detail = UILabel()
        detail.sizeToFit()
        detail.backgroundColor = .lightText
        detail.text = viewModel.getMovieDetail()
        detail.addInterlineSpacing(spacingValue: 8)
        detail.numberOfLines = 0
        detail.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        detail.textColor = .black
        return detail
    }()
    
    // MARK: LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        adSubview()
        makeConstraint()
    }
    // MARK: FUNCS
    func adSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(poster)
        scrollView.addSubview(movieTitle)
        scrollView.addSubview(detail)
    }
    
    func makeConstraint() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
      
        }
        
       poster.snp.makeConstraints { make in
           make.top.equalTo(view.safeAreaInsets)
           make.height.equalTo(400)
           make.right.equalTo(view.snp.right).offset(-20)
           make.left.equalTo(view.snp.left).offset(20)
        }
        
        movieTitle.snp.makeConstraints { make in
            make.top.equalTo(poster.snp.bottom).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
        }
    
        detail.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottom).offset(20)
            make.right.equalTo(view).offset(-10)
            make.left.equalTo(view).offset(10)
           make.bottom.equalTo(scrollView.snp.bottom)
        }
        
    }
    // MARK: EXTENSIONS
}
