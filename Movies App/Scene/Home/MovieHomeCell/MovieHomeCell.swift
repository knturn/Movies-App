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
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        label.backgroundColor = .white
        return label
    }()
    private lazy var cellOverview: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    private lazy var voteLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    private lazy var cellImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .yellow
        return image
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
    func setTitle (_ title: String) {
        cellTitle.text = title.uppercased()
    }
    func setOverview (_ overview: String) {
        cellOverview.text = overview
    }
    func setVote (_ vote: Double) {
        let vote = String(vote)
        voteLabel.text = "Popularity: \(vote)"
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
        addSubview(voteLabel)
    }
    func makeConstraint() {
        voteLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-100)
            make.left.equalToSuperview().offset(100)
            make.right.equalToSuperview().offset(-10)
        }
        cellTitle.snp.makeConstraints {
            $0.left.equalToSuperview().offset(100)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalTo(voteLabel.snp.bottom)
            $0.bottom.equalToSuperview().offset(-30)
        }
        cellOverview.snp.makeConstraints {
            $0.left.equalToSuperview().offset(100)
            $0.right.equalToSuperview().offset(-5)
            $0.top.equalTo(cellTitle.snp.bottom).offset(-2)
            $0.bottom.equalToSuperview().offset(-5)
        }
        
    }
}
