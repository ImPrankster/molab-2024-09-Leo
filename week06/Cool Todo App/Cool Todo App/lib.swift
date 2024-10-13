//
//  lib.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/9.
//

import Foundation
import SwiftUI

func encodeArray(_ array: [String]) -> String {
    if let data = try? JSONEncoder().encode(array),
        let jsonString = String(data: data, encoding: .utf8)
    {
        return jsonString
    }
    return "[]"
}

func decodeArray(from jsonString: String) -> [String] {
    if let data = jsonString.data(using: .utf8),
        let decodedArray = try? JSONDecoder().decode([String].self, from: data)
    {
        return decodedArray
    }
    return []
}

extension Color {
    // Generate a random translucent color
    static func randomColor() -> Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1),
            opacity: 0.5 // Set opacity to make it translucent
        )
    }
}
