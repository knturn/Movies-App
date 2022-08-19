//
//  MovieHomeController.swift
//  Movies App
//
//  Created by Kaan Turan on 17.08.2022.
//

import UIKit
import SnapKit

class MovieHomeController: UIViewController {
    private let viewModel = HomeViewModel()
    // MARK: UI ELEMENTS
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    // MARK: PROPERTIES
    // MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetch {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
        configureTableView()
        makeTableView()
    }
    // MARK: FUNCTIONS
    private func configureTableView() {
        drawDesign()
        addSubViews()
    }
    private func drawDesign() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieHomeCell.self, forCellReuseIdentifier: MovieHomeCell.Identifier.homeCell.rawValue)
    }
    private func addSubViews() {
        view.addSubview(tableView)
    }
}
// MARK: EXTENSION

extension MovieHomeController: ConfigureToTableView {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MovieHomeCell =
                tableView.dequeueReusableCell(
                    withIdentifier: MovieHomeCell.Identifier.homeCell.rawValue) as? MovieHomeCell
        else {return UITableViewCell()
        }
        cell.setTitle(viewModel.getMovieTitle(indexpath: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getCellCount()
    }
}
extension MovieHomeController {
    private func makeTableView() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
