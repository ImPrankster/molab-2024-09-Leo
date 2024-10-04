//
//  ContentView.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/2.
//

import AVFoundation
import SwiftUI

struct ContentView: View {
    @State private var currentTodo = ""
    @State private var todoArr: [String] = []
    @State private var deletedTodoArr: [String] = []

    @EnvironmentObject var audioPlayer: AudioPlayer

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Cool Todo App").bold().font(
                        .system(.largeTitle, design: .serif))
                    NavigationLink(
                        "History",
                        destination:
                            DeletedTodoListView(todoArr: deletedTodoArr)
                    ).buttonStyle(.bordered)
                }
                HStack {
                    InputBoxView(inputText: $currentTodo)
                    Button(
                        action: {
                            todoArr.append(currentTodo)
                            audioPlayer.playAddSound()
                        },
                        label: {
                            Text("Add")
                        }
                    ).buttonStyle(.borderedProminent)
                }
                TodoListView(todoArr: $todoArr, deletedTodoArr: $deletedTodoArr)
            }
            .padding()
        }
    }
}

#Preview {
    @StateObject @Previewable var audioPlayer = AudioPlayer()
    ContentView().environmentObject(audioPlayer)
}
