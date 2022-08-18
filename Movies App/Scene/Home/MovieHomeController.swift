//
//  MovieHomeController.swift
//  Movies App
//
//  Created by Kaan Turan on 17.08.2022.
//

import UIKit
import SnapKit
class MovieHomeController: UIViewController {
    
    //MARK: UI ELEMENTS
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    //MARK: PROPERTIES
    
    
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        makeTableView()
    }
    
    //MARK: FUNCTIONS
    
    private func configureTableView() {
        drawDesign()
        addSubViews()
        
    }
    
    private func drawDesign() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func addSubViews(){
        view.addSubview(tableView)
    }
    
    
    
}
//MARK: EXTENSION

extension MovieHomeController : ConfigureToTableView {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MovieHomeCell()
        cell.textLabel?.text = "TableView added"
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    
}
extension MovieHomeController{
    
    private func makeTableView(){
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


