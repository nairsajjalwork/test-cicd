//
//  CircularImage.swift
//  LeagueCodingChallenge
//
//  Created by Sajjal Nair on 04/09/24.
//

import Foundation
import SwiftUI

// Reusable AsyncImage with Circular Frame
struct CircularAsyncImage: View {
    let url: String
    let size: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .frame(width: size, height: size)
                .clipShape(Circle())
                .scaledToFill()
        } placeholder: {
            ProgressView()
                .frame(width: size, height: size)
        }
    }
}
