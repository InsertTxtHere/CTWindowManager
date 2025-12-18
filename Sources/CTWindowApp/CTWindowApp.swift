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
            CTWindowRootView() {
                ContentView()
            }
        }
    }
}



#Preview {
    CTWindowRootView() {
        ContentView()
    }
        .frame(width: 400)
}
