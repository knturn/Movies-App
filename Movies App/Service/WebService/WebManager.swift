//
//  WebManager.swift
//  Movies App
//
//  Created by Kaan Turan on 17.08.2022.
//

import Foundation
import Alamofire
import SwiftUI

protocol ServiceProtocol {
    func fetchMovies(endPoint: Constant.ServiceEndPoint,
                     onSuccess: @escaping (MovieListModel?) -> Void, onError: @escaping (AFError) -> Void )
}

final class Service: ServiceProtocol {
    typealias Model =  (MovieListModel?) -> Void
    typealias Error = (AFError) -> Void
    
    func fetchMovies(endPoint: Constant.ServiceEndPoint,
                     onSuccess: @escaping Model,
                     onError: @escaping Error) {
        ServiceManager.shared.fetch(path: endPoint.getFullURL()) { (resp: MovieListModel) in
            onSuccess(resp)
        } onError: { error in
            onError(error)
        }
    }
}
