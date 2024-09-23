//
//  TabMenuView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 28/08/2024.
//

import SwiftUI

struct CategoryTabView: View {
    
    var category: Category
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        TabView {
            CarouselCardView(category: category)
                .tabItem {
                    Image(systemName: "square.3.layers.3d.down.left")
                    Text("Voices")
                }
            CardGameView(category: category)
                .tabItem {
                    Image(systemName: "questionmark.diamond")
                    Text("Guess Game")
                }
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .white
        }
        .accentColor(ColorPalette.forestGreen)
        .navigationTitle(category.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            // Customize the back button's appearance
           ToolbarItem(placement: .navigationBarLeading) {
               Button(action: {
                   presentationMode.wrappedValue.dismiss()
               }) {
                   HStack {
                       Image(systemName: "chevron.backward") // Custom back icon
//                       Text("Back")
                   }
               }
           }
           
    // TODO: add pdf generator/
           // Add a custom button to the top right corner
//           ToolbarItem(placement: .navigationBarTrailing) {
//               Button(action: {
//                   // Action for the button
//               }) {
//                   Image(systemName: "plus")
//               }
//           }
        }
    }
}
