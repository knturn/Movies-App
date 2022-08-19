//
//  File.swift
//  Movies App
//
//  Created by Kaan Turan on 17.08.2022.
//
// MARK: SERVICE MANAGER
import Alamofire

final class ServiceManager {
    let utilityQueue = DispatchQueue.global(qos: .userInitiated)

    static let shared: ServiceManager = ServiceManager()
}
extension ServiceManager {
    func fetch<T>(path: String, onSuccess:  @escaping (T) -> Void, onError: (AFError) -> Void) where T: Codable {
        AF.request(path, encoding: JSONEncoding.default).validate().responseDecodable(of: T.self) { response in
            guard let model = response.value else { print(response.error as Any); return}
            onSuccess(model)
        }
    }
}
