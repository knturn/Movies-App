// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
  

import Foundation

// MARK: - MovieModel
struct MovieModel: Codable {
    let results: [Result]
    
    
    enum CodingKeys: String, CodingKey {
        case  results 
    }
}

// MARK: - Result
struct Result: Codable {
    
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let imageURL, releaseDate, title: String?
    
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case originalLanguage
        case originalTitle
        case overview, popularity
        case imageURL = "posterPath"
        case releaseDate
        case title
        case voteAverage
        case voteCount
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
}


