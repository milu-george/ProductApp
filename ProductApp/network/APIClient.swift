//
//  APIClient.swift
//  ProductApp
//
//  Created by Milu Ann George on 28/11/23.
//

import Foundation

class APIClient: NetworkHandler {
    func requestData(from endpoint: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: URL(string: endpoint)!) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "HTTPError", code: 0, userInfo: nil)))
                return
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        
        task.resume()
    }
}
