//
//  UserModel.swift
//  LeagueCodingChallenge
//
//  Created by Sajjal Nair on 04/09/24.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let avatar: String
    let name: String
    let username: String
}
