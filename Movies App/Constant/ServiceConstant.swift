//
//  ServiceConstant.swift
//  Movies App
//
//  Created by Kaan Turan on 17.08.2022.
// https://api.themoviedb.org/3/discover/movie?api_key=21b64be1e49aa6611c35a54b4a51e584
//https://api.themoviedb.org/3/discover/movie?primary_release_date.gte=2014-09-15&primary_release_date.lte=2014-10-22&api_key=21b64be1e49aa6611c35a54b4a51e584

import Foundation

extension Constant {
    enum ServiceEndPoint: String {
        case popularURL = "https://api.themoviedb.org/3/discover/movie?primary_release_date.gte=2014-09-15&primary_release_date.lte=2014-10-22&"
        case kidsURL = "https://api.themoviedb.org/3/discover/movie?certification_country=US&certification.lte=G&sort_by=popularity.desc&"
        
        static let apiKEY = "api_key=21b64be1e49aa6611c35a54b4a51e584"
                
        func getFullURL() -> String {
            return "\(self.rawValue)\(Constant.ServiceEndPoint.apiKEY)"
        }
    }
}
