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

    @AppStorage("todo-arr") private var storedTodoArr: String = "[]"
    @AppStorage("deleted-todos") private var storedDeletedArr: String = "[]"

    @EnvironmentObject var audioPlayer: AudioPlayer
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Cool Todo App").bold().font(
                        .system(.largeTitle, design: .rounded))
                    NavigationLink(
                        "History",
                        destination:
                            DeletedTodoListView(todoArr: deletedTodoArr)
                    ).buttonStyle(.bordered).font(
                        .system(
                            .headline, design: .rounded
                        ))
                }
                HStack {
                    InputBoxView(inputText: $currentTodo)
                    Button(
                        action: {
                            if currentTodo.lengthOfBytes(using: .utf8) > 0 {
                                todoArr.append(currentTodo)
                                audioPlayer.playAddSound()
                                currentTodo = ""
                            }
                        },
                        label: {
                            Text("Add")
                        }
                    ).buttonStyle(.borderedProminent)
                }
                TodoListView(todoArr: $todoArr, deletedTodoArr: $deletedTodoArr)
            }
            .padding()
        }.onAppear(
            perform: {
                todoArr = decodeArray(from: storedTodoArr)
                deletedTodoArr = decodeArray(from: storedDeletedArr)
            }
        ).onChange(
            of: scenePhase,
            initial: false
        ) {
            storedTodoArr = encodeArray(todoArr)
            storedDeletedArr = encodeArray(deletedTodoArr)
        }
    }
}

#Preview {
    @StateObject @Previewable var audioPlayer = AudioPlayer()
    ContentView().environmentObject(audioPlayer)
}
