//
//  CTWindowRootView.swift
//  CTWindowManager
//
//  Created by Nathanael Johnson on 12/18/25.
//

import SwiftUI

public struct CTWindowRootView<Content: View>: View {
    
    let layout: CTWindowLayout
    
    let content: () -> Content
    
    public var body: some View {
        CTLayoutView(layout: layout, content: content)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        layout = CTWindowLayout(parent: nil, orientation: .horizontal, children: [])
//        layout.addChild(CTWindowPane())
//        
//        let vLayout = CTWindowLayout(parent: layout, orientation: .vertical, children: [])
//        vLayout.addChild(CTWindowPane())
//        vLayout.addChild(CTWindowPane())
//        
//        layout.addChild(vLayout)
        
        self.content = content
    }
}

extension View {
    func paneBarItems<Items: View>(@ViewBuilder items: () -> Items) -> some View {
        ZStack(alignment: .topLeading) {
            self
            HStack {
                items()
            }
            .buttonBorderShape(.capsule)
            .background(.ultraThinMaterial, in: .capsule)
            .padding(3)
        }
    }
}
