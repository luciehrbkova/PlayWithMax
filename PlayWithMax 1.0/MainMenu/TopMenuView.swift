//
//  MainMenuView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 01/08/2024.
//

import SwiftUI

struct TopMenuView: View {
    
    @ObservedObject private var viewModel = TopViewModel()
    
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Games")) {
                    ForEach(viewModel.categories, id: \.name) { category in
                        NavigationLink(destination: category.destinationView) {
                            Label(category.name, systemImage: category.imageName)
                                .foregroundColor(category.color)
                        }
                    }
                }
            }
            .navigationTitle("Play with Max")
        }
    }
}

#Preview {
    TopMenuView()
}
