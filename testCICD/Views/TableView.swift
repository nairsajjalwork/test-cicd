//
//  TableView.swift
//  LeagueCodingChallenge
//
//  Created by Sajjal Nair on 04/09/24.
//

import Foundation
import SwiftUI

struct TableView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        NavigationView {
            List(viewModel.profiles) { profile in
                TableViewCell(profile: profile)
            }
            .navigationTitle("Posts")
        }
    }
}
