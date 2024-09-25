//
//  ContentView.swift
//  Cool Stuff 1
//
//  Created by Ruofan Wang on 2024/9/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var r1: Double = Double.random(in: -1...1)
    @State var r2: Double = Double.random(in: -1...1)
    @State var r3: Double = Double.random(in: -1...1)
    @State var r4: Double = Double.random(in: -1...1)
    
    var body: some View {
        VStack {
            CoolImage(r1: $r1, r2: $r2, r3: $r3, r4: $r4)
            Button(action: {
                r1 = Double.random(in: -1...1)
                r2 = Double.random(in: -1...1)
                r3 = Double.random(in: -1...1)
                r4 = Double.random(in: -1...1)
            }) {
                Text("Generate new Image")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }        }
        .padding()
    }
}

#Preview {
    ContentView()
}
