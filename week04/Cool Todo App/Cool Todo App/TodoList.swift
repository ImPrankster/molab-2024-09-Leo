//
//  TodoList.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/2.
//
import SwiftUI

struct TodoListView: View {
    @Binding var todoArr: [String]

    var body: some View {
        List {
            ForEach(
                Array(todoArr.enumerated()), id: \.element,
                content: { index, item in
                    Button(
                        action: {
                            todoArr.remove(at: index)
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

#Preview {
    ContentView()
}
