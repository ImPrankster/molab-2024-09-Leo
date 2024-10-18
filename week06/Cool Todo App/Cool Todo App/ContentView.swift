//
//  ContentView.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/2.
//

import AVFoundation
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var audioPlayer: AudioPlayer
    @EnvironmentObject var todoStore: TodoStore

    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        NavigationStack {
            TabView {
                Tab("Home", systemImage: "pencil.line") {
                    VStack {
                        Text("Cool Todo App").bold().font(
                            .system(.largeTitle, design: .rounded))
                        InputBoxView()
                        TodoListView()
                    }.padding()
                }
                Tab("Deleted", systemImage: "trash") {
                    DeletedTodoListView()
                }
            }
        }.onAppear(
            perform: {
                todoStore.load()
            }
        ).onChange(
            of: scenePhase,
            initial: false
        ) {
            todoStore.save()
        }
    }
}

#Preview {
    @StateObject @Previewable var audioPlayer = AudioPlayer()
    @StateObject @Previewable var todoStore = TodoStore()
    ContentView().environmentObject(audioPlayer).environmentObject(todoStore)
}
