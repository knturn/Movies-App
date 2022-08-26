//
//  DetailViewModel.swift
//  Movies App
//
//  Created by Kaan Turan on 24.08.2022.
//

import Foundation

final class DetailViewModel: NSObject {
    private var movieModel: MovieModel?
    
    // MARK: FUNCS
    
    init(movieModel: MovieModel) {
        self.movieModel = movieModel
    }
    
    func getMovieName() -> String {
        movieModel?.title?.uppercased() ?? "UNKNOWN".uppercased()
    }
    
    func getMovieDetail() -> String {
        movieModel?.overview ?? "No found detail"
    }
    func getMoviePoster() -> String? {
        movieModel?.posterPath
    }
}
