//
//  TableViewCell.swift
//  LeagueCodingChallenge
//
//  Created by Sajjal Nair on 04/09/24.
//

import Foundation
import SwiftUI

struct TableViewCell: View {
    
    var profile: UserProfile
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                
                CircularAsyncImage(url: profile.avatarURL, size: 50)
                
                Text(profile.username)
                    .font(.title3)
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(profile.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(profile.description)
                    .font(.subheadline)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
            }
            .padding(.top)
        }
    }
}
