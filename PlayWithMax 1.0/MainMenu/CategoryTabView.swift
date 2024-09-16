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
        TabView{
            CarouselCardView()
                .tabItem {
                    Image(systemName: "cat.fill")
                    Text("Animal Voices")
                }
            CardGameView()
                    .tabItem {
                        Image(systemName: "hare")
                        Text("Guess Animal")
                    }
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .white
        }
        .accentColor(.teal)
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
           
           // Add a custom button to the top right corner
           ToolbarItem(placement: .navigationBarTrailing) {
               Button(action: {
                   // Action for the button
               }) {
                   Image(systemName: "plus")
               }
           }
        }
    }
}
