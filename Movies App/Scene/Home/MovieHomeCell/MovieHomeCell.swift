//
//  MovieHomeCell.swift
//  Movies App
//
//  Created by Kaan Turan on 18.08.2022.
//

import UIKit

final class MovieHomeCell: UITableViewCell {
    static let identifier: String = "custom"
    
    // MARK: UIELEMENTS
    private lazy var cellTitle: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        return label
    }()
    private lazy var cellOverview: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .gray
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    private lazy var language: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .purple
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    private lazy var cellImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .brown
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    private lazy var populartiyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    // MARK: DEFAULT FUNCS
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: SET CELL DETAILS
    
    func configureCell(model: MovieModel) {

        self.cellTitle.text = model.title
        self.language.text = "Language: \(model.originalLanguage ?? "Unknown")".uppercased()
        self.cellOverview.text = model.overview
        self.scoreLabel.text = "Score: \(model.voteAverage ?? 0)"
        self.populartiyLabel.text = "Popularity: \(model.popularity ?? 0)"
        self.cellImage.setImage(path: model.posterPath)
    }
}
// MARK: EXTENSİON
extension MovieHomeCell {
    func configure() {
        addCellViews()
        makeConstraint()
    }
    func addCellViews() {
        addSubview(cellTitle)
        addSubview(cellOverview)
        addSubview(language)
        addSubview(scoreLabel)
        addSubview(cellImage)
        addSubview(populartiyLabel)
        
    }
    func makeConstraint() {
        cellImage.snp.makeConstraints { make in
            make.top.equalTo(language.snp.top)
            make.bottom.equalToSuperview().offset(-2)
            make.left.equalToSuperview().offset(5)
            make.right.equalTo(language.snp.left).offset(-5)
        }
        language.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-200)
            make.left.equalToSuperview().offset(150)
            make.right.equalToSuperview().offset(-10)
        }
        cellTitle.snp.makeConstraints {
            $0.left.equalTo(cellImage).offset(150)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalTo(language.snp.bottom)
            $0.bottom.equalToSuperview().offset(-100)
        }
        cellOverview.snp.makeConstraints {
            $0.left.equalToSuperview().offset(150)
            $0.right.equalToSuperview().offset(-5)
            $0.top.equalTo(cellTitle.snp.bottom).offset(-2)
            $0.bottom.equalToSuperview().offset(-40)
        }
        scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(cellOverview.snp.bottom).offset(2)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(150)
            make.right.equalToSuperview().offset(-100)
        }
        populartiyLabel.snp.makeConstraints { make in
            make.top.equalTo(cellOverview.snp.bottom).offset(2)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalTo(scoreLabel.snp.right).offset(-30)
            make.right.equalToSuperview().offset(-10)
        }
    }
}
