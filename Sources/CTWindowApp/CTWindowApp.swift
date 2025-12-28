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
    var body: some Scene {
        WindowGroup {
            CTWindowRootView {
                ContentView()
            } layoutDefinition: {
                .hStack(children: [
                    .pane,
                    .vStack(children: [
                        .pane,
                        .pane
                    ])
                ])
            }

        }
    }
}



#Preview {
    CTWindowRootView {
        ContentView()
    } layoutDefinition: {
        .hStack(children: [
            .pane,
            .vStack(children: [
                .pane,
                .pane
            ])
        ])
    }
        .frame(width: 400)
}
