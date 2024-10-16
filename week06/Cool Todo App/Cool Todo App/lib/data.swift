//
//  data.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/15.
//
import SwiftUI

struct todo: Codable, Hashable, Identifiable {
    var id: UUID
    var name: String
    var colorHex: String
    var description: String
}

class TodoStore: ObservableObject {
    @AppStorage("todo-arr") private var storedTodoArr: String = "[]"
    @AppStorage("deleted-todos") private var storedDeletedArr: String = "[]"
    @Published var todoArr: [todo]
    @Published var deletedTodoArr: [todo]

    init(todoArr: [todo], deletedTodoArr: [todo]) {
        self.todoArr = todoArr
        self.deletedTodoArr = deletedTodoArr
    }

    func load() {
        todoArr = decodeTodoArray(from: storedTodoArr)
        deletedTodoArr = decodeTodoArray(from: storedDeletedArr)
    }

    func save() {
        storedTodoArr = encodeTodoArray(todoArr)
        storedDeletedArr = encodeTodoArray(deletedTodoArr)
    }
}
