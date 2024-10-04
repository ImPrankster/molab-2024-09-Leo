//
//  DeletedTodoList.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/3.
//

import SwiftUI

struct DeletedTodoListView: View {
    @State var todoArr: [String]

    var body: some View {
        List {
            ForEach(
                todoArr, id: \.self,
                content: { item in
                    Text(item)
                })
        }
        .listStyle(.plain)
        .background(Color.clear)
    }
}
