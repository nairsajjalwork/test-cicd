//
//  UserProfileModel.swift
//  LeagueCodingChallenge
//
//  Created by Sajjal Nair on 04/09/24.
//

import Foundation

struct UserProfile: Identifiable {
    var id = UUID()
    var username: String
    var title: String
    var description: String
    var avatarURL: String
}
