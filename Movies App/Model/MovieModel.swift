// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
import Foundation

// MARK: - MovieModel
struct MovieModel: Codable {
    let results: [Result]
    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    
    let overview: String?
    let popularity: Double?
    let title: String?
    enum CodingKeys: String, CodingKey {
        case overview, popularity
        case title
    }
}
