//
//  MovieHomeController.swift
//  Movies App
//
//  Created by Kaan Turan on 17.08.2022.
//

import UIKit

class MovieHomeController: UIViewController {
    private let viewModel = MovieHomeViewModel()
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
   override  func viewDidAppear(_ animated: Bool) {
        deselectSelectedRow(animated: animated)
    }
    
    // MARK: FUNCTIONS
    
    private func configureTableView() {
        drawDesign()
        addSubViews()
    }
    private func drawDesign() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieHomeCell.self, forCellReuseIdentifier: MovieHomeCell.identifier)
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
                    withIdentifier: MovieHomeCell.identifier) as? MovieHomeCell
        else {return UITableViewCell()}
        cell.setTitle(viewModel.getMovieTitle(indexpath: indexPath.row))
        cell.setOverview(viewModel.getCellOverview(indexpath: indexPath.row))
        cell.setVote(viewModel.getPopularity(indexpath: indexPath.row))
        cell.backgroundColor = .lightText
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 4.0
        cell.layer.masksToBounds = true
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getCellCount()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = DetailViewController()
        view.movieName = viewModel.getMovieTitle(indexpath: indexPath.row)
        view.movieDetail = viewModel.getCellOverview(indexpath: indexPath.row)
        navigationController?.pushViewController(view, animated: true)
    }
    func deselectSelectedRow(animated: Bool) {
        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: animated)
        }
    }
}
extension MovieHomeController {
    private func makeTableView() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
