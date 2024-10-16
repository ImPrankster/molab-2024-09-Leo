//
//  TodoList.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/2.
//
import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var todoStore: TodoStore
    @EnvironmentObject var audioPlayer: AudioPlayer

    var body: some View {
        List(todoStore.todoArr, id: \.id) { item in
            Section {
                NavigationLink {
                    TodoDetailView(
                        todo: $todoStore.todoArr[
                            todoStore.todoArr.firstIndex(where: {
                                $0.id == item.id
                            }) ?? 0])
                } label: {
                    Text(item.name).font(
                        .system(size: 25, design: .rounded)
                    ).fontWeight(.bold)
                }
            }
            .swipeActions {
                Button(
                    action: {
                        if let index = todoStore.todoArr.firstIndex(where: {
                            $0.id == item.id
                        }) {
                            todoStore.todoArr.remove(at: index)
                        }
                        todoStore.deletedTodoArr.append(item)
                        audioPlayer.playDelSound()
                    },
                    label: {
                        Label("Finish", systemImage: "checkmark")
                    }
                )
                .tint(
                    .green
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
            .listRowBackground(Color(hex: item.colorHex))

        }
        .scrollContentBackground(.hidden)
        .listStyle(.automatic)
        .listSectionSpacing(8)
        .contentMargins(.all, 0, for: .scrollContent).environment(
            \.defaultMinListRowHeight, 80)
    }
}
