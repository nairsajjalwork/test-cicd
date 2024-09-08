//
//  ViewModel.swift
//  LeagueCodingChallenge
//
//  Created by Sajjal Nair on 04/09/24.
//

import Foundation
import Combine

// This is the ViewModel for handling the API calls and also for preparing data the for all the views
class ViewModel: ObservableObject {
    
    @Published var apiKey: String = ""
    @Published var users: [User] = []
    @Published var posts: [Post] = []
    @Published var profiles: [UserProfile] = []
    
    private let networkHandler = NetworkHandler()
    
    /// This is a generic function which handles all the different data fetching
    private func fetchData<T: Decodable>(url: URL, headers: [String: String]? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        networkHandler.sendRequest(url: url, headers: headers) { (result: Result<T, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Error: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
        }
    }
    
    
    /// Fetchs API Key
    func fetchApiKey() {
        fetchData(url: APIEndpoints.login) { (result: Result<ApiKeyResponse, Error>) in
            switch result {
            case .success(let apiKeyResponse):
                self.apiKey = apiKeyResponse.api_key
                self.fetchUsers(apiKey: apiKeyResponse.api_key)
            case .failure(let error):
                print("Error fetching API key: \(error.localizedDescription)")
            }
        }
    }

    /// Fetchs Users
    func fetchUsers(apiKey: String) {
        let headers = ["x-access-token": apiKey]
        fetchData(url: APIEndpoints.users, headers: headers) { (result: Result<[User], Error>) in
            switch result {
            case .success(let fetchedUsers):
                self.users = fetchedUsers
                self.fetchPosts(apiKey: apiKey)
            case .failure(let error):
                print("Error fetching users: \(error.localizedDescription)")
            }
        }
    }

    /// FetchsPosts
    func fetchPosts(apiKey: String) {
        let headers = ["x-access-token": apiKey]
        fetchData(url: APIEndpoints.posts, headers: headers) { (result: Result<[Post], Error>) in
            switch result {
            case .success(let fetchedPosts):
                self.posts = fetchedPosts
                self.mapProfiles()
            case .failure(let error):
                print("Error fetching posts: \(error.localizedDescription)")
            }
        }
    }
    
    /// Maps profiles from users and posts
    func mapProfiles() {
        // Here I am grouping posts by userId
        let groupedPosts = Dictionary(grouping: posts, by: { $0.userId })
        
        // Here I am creating UserProfile for each user and map their corresponding posts
        profiles = users.flatMap { user in
            groupedPosts[user.id]?.map { post in
                UserProfile(
                    username: user.username,
                    title: post.title,
                    description: post.body,
                    avatarURL: user.avatar
                )
            } ?? []
        }
    }
}
