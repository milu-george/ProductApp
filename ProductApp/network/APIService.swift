//
//  APIService.swift
//  ProductApp
//
//  Created by Milu Ann George on 28/11/23.
//

import Foundation

class APIService {
    private let networkHandler: NetworkHandler

    init(networkHandler: NetworkHandler) {
        self.networkHandler = networkHandler
    }

    func fetchData<T: Decodable>(from endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        networkHandler.requestData(from: endpoint) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
