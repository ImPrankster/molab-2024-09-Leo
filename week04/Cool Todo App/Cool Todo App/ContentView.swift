//
//  ContentView.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/2.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTodo = ""
    @State private var todoArr: [String] = []

    var body: some View {
        VStack {
            Text("Cool Todo App").bold().font(
                .system(.largeTitle, design: .serif))
            HStack {
                InputBoxView(inputText: $currentTodo)
                Button(
                    action: {
                        todoArr.append(currentTodo)
                    },
                    label: {
                        Text("Add")
                    }
                ).buttonStyle(.automatic)
            }
            TodoListView(todoArr: $todoArr)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
