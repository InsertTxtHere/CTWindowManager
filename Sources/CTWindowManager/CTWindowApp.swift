//
//  CTWindowApp.swift
//  CTWindow
//
//  Created by Nathanael Johnson on 12/16/25.
//

import SwiftUI

@main
struct CTWindowApp: App {
    var body: some Scene {
        WindowGroup {
            CTWindowRootView() {
                ContentView()
            }
        }
    }
}

public struct CTWindowRootView<Content: View>: View {
    
    let layout: CTWindowLayout
    
    let content: () -> Content
    
    public var body: some View {
        CTWindowLayoutView(layout: layout)
    }
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        layout = CTWindowLayout(parent: nil, orientation: .horizontal, children: [])
        layout.addChild(CTWindowPane())
        
        let vLayout = CTWindowLayout(parent: layout, orientation: .vertical, children: [])
        vLayout.addChild(CTWindowPane())
        vLayout.addChild(CTWindowPane())
        
        layout.addChild(vLayout)
        
        self.content = content
    }
}

#Preview {
    CTWindowRootView() {
        ContentView()
    }
        .frame(width: 400)
}
