//
//  ServiceConstant.swift
//  Movies App
//
//  Created by Kaan Turan on 17.08.2022.
// https://api.themoviedb.org/3/discover/movie?api_key=21b64be1e49aa6611c35a54b4a51e584

import Foundation


extension Constant {
    
    
    enum ServiceEndPoint : String {
        
        case Base_URL = "https://api.themoviedb.org/3/discover/movie?"
        case Api_KEY = "api_key=21b64be1e49aa6611c35a54b4a51e584"
        static func moviesServiceEndPoint () -> String {
            "\(Base_URL.rawValue)\(Api_KEY.rawValue)"
        }
        
        
    }
}
