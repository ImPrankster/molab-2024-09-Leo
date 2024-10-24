//
//  ContentView.swift
//  Time Machine
//
//  Created by Ruofan Wang on 2024/10/18.
//

import SwiftUI

struct ContentView: View {
    @State var forePickerIsPresented = false
    @State var backPickerIsPresented = false
    @State var foreResult: [UIImage] = []
    @State var backResult: [UIImage] = []
    @State var blendImage: [UIImage] = []

    var body: some View {
        VStack {
            if foreResult.count < 1 {
                Text("First, select a recent photo of yourself").font(
                    .largeTitle
                )
                .fontWeight(.bold).fontDesign(.rounded)
                Button("Select", systemImage: "photo.on.rectangle.angled") {
                    forePickerIsPresented.toggle()
                }.buttonStyle(.borderedProminent).controlSize(.large).font(
                    .title2)
            }
            if foreResult.count >= 1 && backResult.count < 1 {
                Text("Then, select a few landscape photo from the past").font(
                    .largeTitle
                )
                .fontWeight(.bold).fontDesign(.rounded)
                Button("Select", systemImage: "photo.on.rectangle.angled") {
                    backPickerIsPresented.toggle()
                }.buttonStyle(.borderedProminent).controlSize(.large).font(
                    .title2)
            }
            if backResult.count >= 1 && foreResult.count >= 1
                && blendImage.count < 1
            {
                Button("Generate Blend") {
                    blendImage = backResult.map {
                        img in
                        BlendProcessor.shared.generateBlend(
                            backImage: img, foreImage: foreResult[0])
                        return BlendProcessor.shared.photoOutput
                    }
                }.buttonStyle(.borderedProminent).controlSize(.large).font(
                    .title2)
            }
            if blendImage.count >= 1 {
                VStack {
                    TabView {
                        ForEach(blendImage, id: \.self) {
                            img in
                            Image(uiImage: img)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }.tabViewStyle(.page)
                    Button ("Reset") {
                        blendImage.removeAll()
                        foreResult.removeAll()
                        backResult.removeAll()
                    }
                }
            }
        }
        .padding()
        .sheet(isPresented: $forePickerIsPresented) {
            PhotoPicker(
                pickerResult: $foreResult,
                isPresented: $forePickerIsPresented)
        }
        .sheet(isPresented: $backPickerIsPresented) {
            PhotoPicker(
                pickerResult: $backResult,
                isPresented: $backPickerIsPresented, limit: 20)
        }
    }
}

#Preview {
    ContentView()
}
