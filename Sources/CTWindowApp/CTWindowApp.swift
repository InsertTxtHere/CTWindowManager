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
    
    enum Selection: String, CTTabSelection {
        case main = "Main"
        
        var name: String { self.rawValue }
        var id: String { self.rawValue }
    }
    
    var body: some Scene {
        WindowGroup {
            CTWindowRootView(selection: Selection.self) { selection in
                ContentView(selection: selection)
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


//#Preview {
//    @Previewable @State var selectedLayout: CTLayoutDefenition = .pane
//
//    CTWindowRootView {
//        ContentView { layout in
//            selectedLayout = layout
//        }
//    } layoutDefinition: { selectedLayout }
//        .frame(width: 400)
//}
