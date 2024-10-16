//
//  InputBox.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/2.
//

import SwiftUI

struct InputBoxView: View {
    @State private var inputText = ""

    @EnvironmentObject var audioPlayer: AudioPlayer
    @EnvironmentObject var todoStore: TodoStore

    var body: some View {
        HStack {
            TextField("What to do next", text: $inputText).textFieldStyle(
                .roundedBorder)

            Button(
                action: {
                    if inputText.lengthOfBytes(using: .utf8) > 0 {
                        todoStore.todoArr.append(
                            todo(
                                id: UUID(), name: inputText,
                                colorHex: Color.randomColor().toHex()
                                    ?? "#000000", description: "")
                        )
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
