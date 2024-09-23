//
//  CardView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 13/09/2024.
//

import SwiftUI

struct CardView: View {
    var animal: Image
    var isTapped: Bool
    var backGround: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [.white, backGround]), startPoint: .top, endPoint: .bottomTrailing))
                .shadow(color: isTapped ? .clear : .black.opacity(0.6), radius: isTapped ? 0 : 15, x: 0, y: 0) // Remove shadow when tapped
                .frame(minWidth: 280, maxHeight: 440)
                .padding()
            animal
                .resizable()
                .frame(width: 280, height: 280)
        }
        .scrollTransition { EmptyVisualEffect, phase in
                    EmptyVisualEffect
                        .opacity(phase.isIdentity ? 1.0 : 0.8)
                        .scaleEffect(x: phase.isIdentity ? 1.0 : 0.8,
                                     y: phase.isIdentity ? 1.0 : 0.8)
                }
    }
}
