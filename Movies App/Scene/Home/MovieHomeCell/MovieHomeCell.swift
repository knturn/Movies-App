//
//  MovieHomeCell.swift
//  Movies App
//
//  Created by Kaan Turan on 18.08.2022.
//

import UIKit
import SnapKit
final class MovieHomeCell: UITableViewCell {
    // MARK: UIELEMENTS
    private let cellTitle: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    private let cellOverview: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
    }()
    private let cellImage: UIImageView = {
        let image = UIImageView()
            image.backgroundColor = .yellow
        return image
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: IDENTIFIER
    enum Identifier: String {
        case homeCell = "custom"
    }
    func setTitle (_ title: String) {
        cellTitle.text = title
    }
}

extension MovieHomeCell {
    func configure() {
        addCellViews()
        makeConstraint()
    }
    func addCellViews() {
        addSubview(cellImage)
        addSubview(cellTitle)
        addSubview(cellOverview)
    }
    func makeConstraint() {
        cellTitle.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(15)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}
