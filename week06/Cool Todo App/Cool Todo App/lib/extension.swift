//
//  extension.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/15.
//

import SwiftUI

extension Color {
    // Generate a random translucent color
    static func randomColor() -> Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1),
            opacity: 0.5  // Set opacity to make it translucent
        )
    }
}
