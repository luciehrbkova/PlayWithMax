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
            // Use a LazyVGrid to create a grid layout
            let columns = [
//                GridItem(.flexible()),  // Flexible width for each column
                GridItem(.flexible())
            ]

            ScrollView {
                LazyVGrid(columns: UIDevice.current.userInterfaceIdiom == .pad ? columns : [GridItem(.flexible())], spacing: 20) {
                    ForEach(viewModel.categories, id: \.self) { category in
                        NavigationLink(destination: CategoryTabView(category: category)) {
                            categoryLinkView(header: category.name, backgroundImage: category.backgroundImage)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Play With Max")
        }
    }
    
    func categoryLinkView(header: String, backgroundImage: String) -> some View  {
        ZStack{
            Image(backgroundImage)
                .resizable()
                .scaledToFill()
            VStack{
                HStack{
                    Text(header)
                        .padding(8)
                        .background(Color.white.opacity(0.95)) // Lowered background opacity
                        .foregroundColor(Color(.label))
                        .cornerRadius(10)
                        .frame(maxHeight: 30, alignment: .leading)
                        .shadow(radius: 5)
                    Spacer()
                    }
                Spacer()
            }
            .frame(maxHeight: 80)
            .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 115)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    TopMenuView()
}
