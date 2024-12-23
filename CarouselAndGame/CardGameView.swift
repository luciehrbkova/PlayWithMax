//
//  CardGameView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 13/09/2024.
//

import SwiftUI

struct CardGameView: View {
    
    @ObservedObject private var viewModel: CardViewModel
    @Binding var selectedTab: Int // Add a binding to the selected tab
    var category: Category
    
    init(category: Category,
        selectedTab: Binding<Int>) {
        self.category = category
        self._selectedTab = selectedTab
        self.viewModel = CardViewModel(items: category.items)
        }
    
    var body: some View {
        VStack {
            VStack {
                FlipCardView(viewModel: viewModel,
                             sfSymbol: Image(systemName: "music.quarternote.3"))
                    .onTapGesture {
                        viewModel.mainCardTapped()
                    }
                HStack
                {
                    ForEach(0..<2) { index in
                        choiceButton(animal: viewModel.getAnimal(index: index).image,
                                     number: index, background: (index == viewModel.correctAnswer) ? .white : viewModel.cardBackgroundColor)
                    }

                }
                .padding(.top, 100)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Allow the view to expand to fill the screen
            .background(
                Image(category.backgroundImage)
                   .resizable()
                   .scaledToFill()
                   .clipped()
           )
           .edgesIgnoringSafeArea(.bottom) // Optional to ensure it respects safe area
           .padding(.horizontal, 50)
        }
        .onChange(of: selectedTab) { newTab in
           if newTab != 1 {
               viewModel.stopSound()
           }
       }
    }
    
    func choiceButton(animal: Image, number: Int, background: Color) -> some View {
        Button {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            viewModel.choiceButtonTapped(number: number)
        } label: {
            animal
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding(12)
        }
        .contentShape(Rectangle()) // Entire frame is tappable
        .background(background)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

//#Preview {
//    CardGameView()
//}
