//
//  TodoList.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/2.
//
import SwiftUI

struct TodoListView: View {
    @Binding var todoArr: [String]
    @Binding var deletedTodoArr: [String]

    @EnvironmentObject var audioPlayer: AudioPlayer
    
    var body: some View {
        List {
            ForEach(
                Array(todoArr.enumerated()), id: \.element,
                content: { index, item in
                    Button(
                        action: {
                            todoArr.remove(at: index)
                            deletedTodoArr.append(item)
                            audioPlayer.playDelSound()
                        },
                        label: {
                            // Button label
                            Text(item)
                        })
                })
        }
        .listStyle(.plain)
        .background(Color.clear)
    }
}
