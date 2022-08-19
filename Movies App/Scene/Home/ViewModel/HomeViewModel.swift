//
//  HomeViewModel.swift
//  Movies App
//
//  Created by Kaan Turan on 18.08.2022.
//

import Foundation

final class HomeViewModel: NSObject {
    private let service = Service()
    private var movieResultList = [Result]()
    func fetch(comptletionHandler: @escaping () -> Void) {
        service.fetchMovies { [weak self] response in
            guard let model = response else {
                return print("error")
            }
            self?.movieResultList = model.results
            comptletionHandler()
        } onError: { error in
            print("Kaan  \(error)")
        }
    }
}

 // MARK: TABLEVIEW FUNCS
extension HomeViewModel {
    func getCellCount() -> Int {
       movieResultList.count
    }
    func getMovieTitle(indexpath: Int) -> String {
        movieResultList[indexpath].title ?? "Title Not Found"
    }
}
