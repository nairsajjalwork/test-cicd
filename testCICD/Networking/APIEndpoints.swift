//
//  APIEndpoints.swift
//  LeagueCodingChallenge
//
//  Created by Sajjal Nair on 05/09/24.
//

import Foundation

/// API Endpoints for various apis I am hitting
struct APIEndpoints {
    static let login = URL(string: "https://engineering.league.dev/challenge/api/login")!
    static let users = URL(string: "https://engineering.league.dev/challenge/api/users")!
    static let posts = URL(string: "https://engineering.league.dev/challenge/api/posts")!
}
