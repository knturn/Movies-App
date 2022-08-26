//
//  HomeViewModel.swift
//  Movies App
//
//  Created by Kaan Turan on 18.08.2022.
//

import Foundation
import SwiftUI

final class MovieHomeViewModel: NSObject {
    private let service = Service()
    private var movieResultList = [MovieModel]()
    
    func fetch(pageType: PageType, comptletionHandler: @escaping () -> Void) {
        
        service.fetchMovies(endPoint: pageType.getEndpoint()) { [weak self] response in
            guard let model = response else {
                return print("error")
            }
            self?.movieResultList = model.results ?? [MovieModel]()
            comptletionHandler()
        } onError: { error in
            print("We got \(error)")
        }
    }
}
enum PageType: Int {
    case popular = 0
    case kids = 1
    
    func getEndpoint() -> Constant.ServiceEndPoint {
        switch self {
        case .popular:
            return Constant.ServiceEndPoint.popularURL
        case .kids:
            return Constant.ServiceEndPoint.kidsURL
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
    
    func getModel(indexpath: Int) -> MovieModel {
        let model = movieResultList[indexpath]
        return model
    }
    func getPosterPath(indexpath: Int) -> String {
        guard let path = movieResultList[indexpath].posterPath else {return "Nil path"}
        return path
    }
}
