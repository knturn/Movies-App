//
//  WebManager.swift
//  Movies App
//
//  Created by Kaan Turan on 17.08.2022.
//

import Foundation
import Alamofire

protocol ServiceProtocol {
    func fetchMovies(onSuccess: @escaping (MovieModel?) -> (), onError: @escaping (AFError) -> () )
}

final class Service : ServiceProtocol {
    func fetchMovies(onSuccess: @escaping (MovieModel?) -> (), onError: @escaping (AFError) -> ()) {
        ServiceManager.shared.fetch(path: Constant.ServiceEndPoint.moviesServiceEndPoint()) { (response: MovieModel) in
            
            onSuccess(response)
            
        } onError: { error in
            
            onError(error)
        }
        
    }
    
    
}
