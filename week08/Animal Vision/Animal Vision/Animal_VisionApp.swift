//
//  Animal_VisionApp.swift
//  Animal Vision
//
//  Created by Ruofan Wang on 2024/10/29.
//

import SwiftUI

@main
struct Animal_VisionApp: App {
    @StateObject var model = ContentViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}
