//
//  HomeViewModel.swift
//  Movies App
//
//  Created by Kaan Turan on 18.08.2022.
//

import Foundation

final class MovieHomeViewModel: NSObject {
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
            print("We got \(error)")
        }
    }
}

// MARK: TABLEVIEW FUNCS
extension MovieHomeViewModel {
    func getCellCount() -> Int {
        movieResultList.count
    }
    
    func getMovieTitle(indexpath: Int) -> String {
        movieResultList[indexpath].title ?? "Title Not Found"
    }
    
    func getCellOverview(indexpath: Int) -> String {
        guard var overView = movieResultList[indexpath].overview else {return "Nothing here"}
        if overView.isEmpty {
            overView = "We have no idea"
        }
        return overView
    }
    func getPopularity(indexpath: Int) -> Double {
        guard let vote = movieResultList[indexpath].popularity else {return 0}
        return vote
    }
    
}
