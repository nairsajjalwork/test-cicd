//
//  ContentView.swift
//  testCICD
//
//  Created by Sajjal Nair on 08/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        VStack {
            TableView(viewModel: viewModel)
        }
        .onAppear {
            viewModel.fetchApiKey()
        }
    }
}

#Preview {
    ContentView()
}
