//
//  InputBox.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/2.
//

import SwiftUI

struct InputBoxView: View {
    @Binding var inputText: String

    var body: some View {
        VStack {
            TextField("Enter text here", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}
