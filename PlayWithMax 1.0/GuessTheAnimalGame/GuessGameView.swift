//
//  GuessGameView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 26/07/2024.
//

import SwiftUI

struct GuessGameView: View {
    @State private var isFlipped = false
    
    var body: some View {
        VStack {
            Text("Guess Farm Animal")
            VStack {
                FlipCardView(isFlipped: $isFlipped)
                HStack
                {
                    choiceButton(animal: "cat")
                    Spacer()
                    choiceButton(animal: "goat")
                }
                .padding(.top, 100)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Allow the view to expand to fill the screen
           .background(
               Image("farm1")
                   .resizable()
                   .scaledToFill()
                   .clipped()
           )
           .edgesIgnoringSafeArea(.all) // Optional to ensure it respects safe area
           .padding(.horizontal, 50)
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    func choiceButton(animal: String) -> some View {
        Button {
            print("hello cat")
            isFlipped.toggle()
        } label: {
            Image(animal)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding(12)
        }
        .contentShape(Rectangle()) // Entire frame is tappable
        .background(.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
    

}

#Preview {
    GuessGameView()
}
