//
//  CTWindowRootView.swift
//  CTWindowManager
//
//  Created by Nathanael Johnson on 12/18/25.
//

import SwiftUI

public struct CTWindowRootView<Selection: CTTabSelection, Content: View>: View {
    
    @State var layout: CTWindowLayout
    
    let content: (_ selection: Selection) -> Content
    
    public var body: some View {
        CTLayoutView(layout: layout, content: content)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    public init(selection: Selection.Type, @ViewBuilder content: @escaping (_ selection: Selection) -> Content, layoutDefinition: () -> CTLayoutDefenition) {
        self.content = content

        switch layoutDefinition() {
        case .vStack(let children):
            layout = layoutDefinition().cunstructLayout(parent: nil) as! CTWindowLayout
        case .hStack(let children):
            layout = layoutDefinition().cunstructLayout(parent: nil) as! CTWindowLayout
        case .pane:
            layout = CTWindowLayout(parent: nil, orientation: .horizontal, children: [])
            layout.children = [layoutDefinition().cunstructLayout(parent: layout) as! CTWindowPane]
        }
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
