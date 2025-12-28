//
//  ContentView.swift
//  CTWindow
//
//  Created by Nathanael Johnson on 12/16/25.
//

import SwiftUI
import CTWindowManager

struct ContentView: View {
    
    let color = Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    
    let loadLayout: (_ layout: CTLayoutDefenition) -> ()
    
    var defoultLayout: CTLayoutDefenition {
        .hStack(children: [
            .pane,
            .vStack(children: [
                .pane,
                .pane
            ])
        ])
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Divider()
            Text("Load Layouts")
            
            Button("Defoult") {
                loadLayout(defoultLayout)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
    }
}

#Preview {
    ContentView { layout in
        
    }
}
