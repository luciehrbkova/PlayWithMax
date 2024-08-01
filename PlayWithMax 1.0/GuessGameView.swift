//
//  GuessGameView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 26/07/2024.
//

import SwiftUI
//
//struct GuessGameView: View {
//    
//    var temporaryAnimal = animals.first!.image
//    let columns = [GridItem(.adaptive(minimum: 100), spacing: 10)]
//    let options = ["cat", "dog", "goat", "rabbit"]
//    
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 10)
//                .fill(LinearGradient(gradient: Gradient(colors: [ .white, colors.first!]), startPoint: .top, endPoint: .bottomTrailing))
//                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
//                .frame(minWidth: 250, minHeight: 400)
//                .padding()
//            Text(temporaryAnimal)
//                .font(.system(size: 180))
//        }
//        LazyVGrid(columns: columns, spacing: 10) {
//            ForEach(animals, id: \.name) { animal in
//                GuessButton
//            }
//        }
//        .background(.pink)
//        
//    }
//    
//    var GuessButton: some View {
//        Button {
//            print("Hey guessed! ")
//        } label: {
//            Text(temporaryAnimal)
//                .font(.system(size: 50))
//                .padding()
//        }
//        .buttonStyle(BorderedButtonStyle())
//
//    }
//}
//
//#Preview {
//    GuessGameView()
//}
