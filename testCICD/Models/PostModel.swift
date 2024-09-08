//
//  PostModel.swift
//  LeagueCodingChallenge
//
//  Created by Sajjal Nair on 04/09/24.
//

import Foundation

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
