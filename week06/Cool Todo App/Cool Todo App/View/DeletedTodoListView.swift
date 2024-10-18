//
//  TodoList.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/2.
//
import SwiftUI

struct DeletedTodoListView: View {
    @EnvironmentObject var todoStore: TodoStore

    var body: some View {
        List(todoStore.deletedTodoArr, id: \.id) { item in
            Section {
                    Text(item.name).font(
                        .system(size: 25, design: .rounded)
                    ).fontWeight(.bold)
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
        .listStyle(.sidebar)
        .listSectionSpacing(8)
        .contentMargins(.all, 0, for: .scrollContent).environment(
            \.defaultMinListRowHeight, 80)
        .padding()
    }
}
