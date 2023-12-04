//
//  NetworkHandler.swift
//  ProductApp
//
//  Created by Milu Ann George on 28/11/23.
//

import Foundation

protocol NetworkHandler {
    func requestData(from endpoint: String, completion: @escaping (Result<Data, Error>) -> Void)
}
