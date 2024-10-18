//
//  Cool_Todo_AppApp.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/2.
//

import SwiftUI

@main
struct Cool_Todo_AppApp: App {
    @StateObject var audioPlayer = AudioPlayer()
    @StateObject var todoStore = TodoStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(audioPlayer).environmentObject(todoStore)
        }
    }
}
