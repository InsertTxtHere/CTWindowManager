//
//  CTWindowApp.swift
//  CTWindow
//
//  Created by Nathanael Johnson on 12/16/25.
//

import SwiftUI
import CTWindowManager

@main
struct CTWindowApp: App {
    
    @State var selectedLayout: CTLayoutDefenition = .pane
    
    var body: some Scene {
        WindowGroup {
            CTWindowRootView {
                ContentView { layout in
                    selectedLayout = layout
                }
            } layoutDefinition: { .defoultLayout() }

        }
    }
}

extension CTLayoutDefenition {
    static func defoultLayout() -> CTLayoutDefenition {
        .hStack(children: [
            .pane,
            .vStack(children: [
                .pane,
                .pane
            ])
        ])
    }
}


#Preview {
    @Previewable @State var selectedLayout: CTLayoutDefenition = .pane

    CTWindowRootView {
        ContentView { layout in
            selectedLayout = layout
        }
    } layoutDefinition: { selectedLayout }
        .frame(width: 400)
}
