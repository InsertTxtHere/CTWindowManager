//
//  ContentView.swift
//  CTWindow
//
//  Created by Nathanael Johnson on 12/16/25.
//

import SwiftUI

struct ContentView: View {
    
    let color = Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
    }
}

#Preview {
    ContentView()
}
