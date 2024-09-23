//
//  Color.swift
//  PlayWithMax
//
//  Created by Lucie Hrbkova on 23/09/2024.
//

import SwiftUI

extension Color {
    init?(hex: String) {
        let r, g, b: Double

        // Remove the hash (#) if it's included
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        var hexFormatted = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex

        // If the hex string is not 6 characters long, return nil
        guard hexFormatted.count == 6 else {
            return nil
        }

        // Convert the hex string to an integer
        let scanner = Scanner(string: hexFormatted)
        var hexInt: UInt64 = 0

        // Scan the hex value
        guard scanner.scanHexInt64(&hexInt) else {
            return nil
        }

        r = Double((hexInt >> 16) & 0xFF) / 255.0
        g = Double((hexInt >> 8) & 0xFF) / 255.0
        b = Double(hexInt & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}

struct ColorPalette {
    static let forestGreen = Color(hex: "#368FAD")
}


