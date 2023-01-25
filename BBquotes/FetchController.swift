//
//  FetchController.swift
//  BBquotes
//
//  Created by Aymeric Pilaert on 25/01/2023.
//

import Foundation

struct FetchController {
    enum NetworkError: Error {
        case badURL, badResponse
    }
    
    private let baseURL = URL(string: "https://www.breakingbadapi.com/api/")!
    
    func fetchQuote() async throws -> Quote {
        let quoteURL = baseURL.appendingPathComponent("quote/random")
        
        let (data, response) = try await URLSession.shared.data(from: quoteURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        
        return quote
    }
}
