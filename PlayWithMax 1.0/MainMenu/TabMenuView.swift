//
//  TabMenuView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 28/08/2024.
//

import SwiftUI

struct TabMenuView: View {
    var body: some View {
        TabView{
            CarouselCardView()
                .tabItem {
                    Image(systemName: "cat.fill")
                    Text("Animal Voices")
                }
            GuessGameView()
                    .tabItem {
                        Image(systemName: "hare")
                        Text("Guess Animal")
                    }
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .white
        }
        .accentColor(.teal)
    }
    
    
    private func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemTeal // Change this to your desired color
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // Set title text color
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white] // Set large title text color

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
}

#Preview {
    TabMenuView()
}
