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
                Array(todoArr.enumerated()), id: \.offset,
                content: { index, item in
                    Section {
                        Button(
                            action: {
                            },
                            label: {
                                Text(item).font(
                                    .system(size: 25, design: .rounded)
                                ).fontWeight(.bold)
                            }
                        )

                    }
                    .swipeActions {
                        Button("Delete") {
                            todoArr.remove(at: index)
                            deletedTodoArr.append(item)
                            audioPlayer.playDelSound()
                        }
                        .tint(
                            .red
                        )
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 25.0, style: .continuous))
                    }
                    .listRowInsets(
                        .init(
                            top: 0,
                            leading: 40,
                            bottom: 0,
                            trailing: 40
                        )
                    )
                    .listRowBackground(Color.randomColor())
                })
        }
        .scrollContentBackground(.hidden)
        .listStyle(.automatic)
        .listSectionSpacing(8)
        .contentMargins(.all, 0, for: .scrollContent).environment(
            \.defaultMinListRowHeight, 80)
    }
}
