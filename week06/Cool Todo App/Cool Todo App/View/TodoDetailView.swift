//
//  TodoDetailView.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/15.
//
import SwiftUI

struct TodoDetailView: View {
    @Binding var todo: todo

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    .white, Color(hex: todo.colorHex) ?? .black,
                ]), startPoint: .top,
                endPoint: .bottom
            ).edgesIgnoringSafeArea(.all)
            VStack {
                Text(
                    todo.name
                ).bold().font(
                    .system(.largeTitle, design: .rounded))
                Text(
                    "Note to self:"
                ).bold().font(
                    .system(.callout, design: .rounded))
                TextEditor(text: $todo.description)
                    .foregroundStyle(.foreground)
                    .background(Color.clear)
                    .scrollContentBackground(.hidden)
                    .font(.system(.title2, design: .rounded))
                    .padding(.horizontal)
            }
        }
    }
}
