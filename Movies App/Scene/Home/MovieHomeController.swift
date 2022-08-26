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
     private lazy var control: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Popular", "For Kids"])
        control.selectedSegmentIndex = 0
         control.backgroundColor = view.backgroundColor
        control.tintColor = .white
        control.addTarget(self, action: #selector(changeURL), for: .valueChanged)
         control.addTarget(self, action: #selector(getColor), for: .valueChanged)
        return control
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = "Movies"
        navigationController?.navigationBar.backgroundColor = .lightGray
        navigationController?.navigationBar.barTintColor = .lightGray
        
        viewModel.fetch(pageType: .popular) {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
        configureTableView()
        makeTableView()
        makeControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.backgroundColor = view.backgroundColor
    }
    
    override  func viewDidAppear(_ animated: Bool) {
        deselectSelectedRow(animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    // MARK: FUNCTIONS
    
    @objc func getColor(sender: UISegmentedControl) {
        view.backgroundColor = sender.selectedSegmentIndex == 0 ? .lightGray : .orange
            navigationController?.navigationBar.backgroundColor = sender.selectedSegmentIndex == 0 ?
            .lightGray : .orange
            navigationController?.navigationBar.barTintColor = sender.selectedSegmentIndex == 0 ? .lightGray : .orange
        control.backgroundColor = sender.selectedSegmentIndex == 0 ? .lightGray : .orange
    }
    
    @objc func changeURL(sender: UISegmentedControl) {
        
        guard let page = PageType(rawValue: sender.selectedSegmentIndex) else { return }
        viewModel.fetch(pageType: page) {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
                self?.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            }
        }
    }
    
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
        view.addSubview(control)
    }
    
}
// MARK: EXTENSION

extension MovieHomeController: ConfigureToTableView {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MovieHomeCell()
        cell.configureCell(model: viewModel.getModel(indexpath: indexPath.row))
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.7
        cell.layer.masksToBounds = true
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getCellCount()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = DetailViewModel(movieModel: viewModel.getModel(indexpath: indexPath.row))
        let view = DetailViewController(viewModel: model)
        navigationController?.pushViewController(view, animated: true)
    }
    func deselectSelectedRow(animated: Bool) {
        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: animated)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}
extension MovieHomeController {
    private func makeTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
}
extension MovieHomeController {
    private func makeControl() {
        self.control.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(95)
            make.height.equalTo(20)
            make.width.equalTo(120)
            make.centerX.equalTo(view.snp.centerX)
            
        }
    }
}
