//
//  ContentView.swift
//  CTWindow
//
//  Created by Nathanael Johnson on 12/16/25.
//

import SwiftUI
import CTWindowManager

struct ContentView: View {
    
    let color = Color(hue: .random(in: 0...1), saturation: 0.7, brightness: 0.6)
    
    @State var selection: CTWindowApp.Selection
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Divider()
            Text("Load Layouts")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
    }
}
