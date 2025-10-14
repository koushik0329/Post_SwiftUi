//
//  NetworkManager.swift
//  NewsListII
//
//  Created by Koushik Reddy Kambham on 10/11/25.
//

import Foundation

protocol Network {
    func fetchData<T: Decodable>(from urlString : String) async throws -> T
}

class NetworkManager : Network {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchData<T: Decodable>(from urlString : String) async throws -> T {

        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let fetchedData = try JSONDecoder().decode(T.self, from: data)
            return fetchedData
        }
        catch {
            throw NetworkError.requestFailed(error)
        }
    }
}
