//
//  CarouselCardView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 13/09/2024.
//

import SwiftUI

struct CarouselCardView: View {
    
    @ObservedObject private var viewModel: CardViewModel
    @State private var tappedImage: String?
    @Binding var selectedTab: Int // Add a binding to the selected tab
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var category: Category
    
    init(category: Category,
         selectedTab: Binding<Int>
        ) {
        self.category = category
        self._selectedTab = selectedTab
        self.viewModel = CardViewModel(items: category.items)
      }
    
    var body: some View {
        VStack {
            ZStack {
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(viewModel.animals, id: \.name) { animal in
                            CardView(animal: animal.image, isTapped: tappedImage == animal.name, backGround: .white)
                                .onTapGesture {
                                    viewModel.playTappedAnimal(animal: animal.name)
                                    withAnimation {
                                        tappedImage = tappedImage == animal.name ? nil : animal.name
                                    }
                                    print(animal.name)
                                    print(selectedTab)
                                }
                        }
                        
                    }
                    .padding()
                    .scrollTargetLayout()
                }
                .contentMargins(0, for: .scrollContent)
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
           .background(
            Image(category.backgroundImage)
                   .resizable()
                   .scaledToFill()
                   .clipped()
           )
           .edgesIgnoringSafeArea(.bottom)
        }
        .onChange(of: selectedTab) { newTab in
            if newTab != 0 {
                viewModel.stopSound() // Stop sound if the selected tab is not the current tab
            }
        }
    }
}

//#Preview {
//    CarouselCardView()
//}
