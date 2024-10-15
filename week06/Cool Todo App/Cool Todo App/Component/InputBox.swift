//
//  InputBox.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/2.
//

import SwiftUI

struct InputBoxView: View {
    @Binding var inputText: String
    @Binding var todoArr: [String]

    @EnvironmentObject var audioPlayer: AudioPlayer

    var body: some View {
        HStack {
            TextField("What to do next", text: $inputText).textFieldStyle(
                .roundedBorder)

            Button(
                action: {
                    if inputText.lengthOfBytes(using: .utf8) > 0 {
                        todoArr.append(inputText)
                        inputText = ""
                        audioPlayer.playAddSound()
                    }
                },
                label: {
                    Text("Add")
                }
            ).buttonStyle(.borderedProminent)
        }
    }
}
