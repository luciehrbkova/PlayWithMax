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
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var category: Category
    
    init(category: Category) {
          self.category = category
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
    }
}

//#Preview {
//    CarouselCardView()
//}
