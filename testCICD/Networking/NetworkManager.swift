//
//  NetworkManager.swift
//  LeagueCodingChallenge
//
//  Created by Sajjal Nair on 04/09/24.
//

import Foundation

/// A Generic Network Handling function for making API calls to the server
class NetworkHandler {
    
    func sendRequest<T: Decodable>(url: URL, headers: [String: String]? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        
        // Create a request objec for the url
        var request = URLRequest(url: url)
        
        // Add headers to the api request if they are present, in our case we have to pass in the x-access-token
        if let headers = headers {
            headers.forEach { request.addValue($1, forHTTPHeaderField: $0) }
        }
        
        // Creating a data task using the URLSession.shared to perform the network request.
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Check if there was an error in the request.
            if let error = error {
                // If an error occurred, call the completion handler with the failure case.
                completion(.failure(error))
                return
            }
            
            // Ensure that data was received from the network request.
            guard let data = data else {
                // If no data was received, call the completion handler with a failure case.
                // Create a custom error indicating "No Data" was received.
                completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                return
            }
            
            do {
                // Attempt to decode the received data into the expected type T.
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                // If decoding is successful, call the completion handler with the success case.
                completion(.success(decodedResponse))
            } catch {
                // If decoding fails, call the completion handler with the error.
                completion(.failure(error))
            }
        }.resume()
    }
}
