//
//  CTWindowLayoutView.swift
//  CTWindow
//
//  Created by Nathanael Johnson on 12/17/25.
//

import SwiftUI

struct CTLayoutView<Content: View>: View {
    
    @State var layout: CTWindowLayout
    
    let content: () -> Content
    
    var body: some View {
        ZStack {
            if layout.children.count == 0 {
                Button() {
                    layout.children.append(CTWindowPane())
                } label: {
                    Image(systemName: "plus")
                        .padding(5)
                        .background(.tertiary, in: .capsule)
                }
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            } else {
                switch layout.orientation {
                case .horizontal:
                    HSplitView {
                        childrenView()
                    }
                case .vertical:
                    VSplitView {
                        childrenView()
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func childrenView() -> some View {
        ForEach(layout.children, id: \.id) { child in
            switch child {
            case is CTWindowPane:
                CTPaneView(content: content)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .paneBarItems {
                        Button {
                            layout.removeChild(child)
                        } label: {
                            Image(systemName: "xmark")
                        }
                        
                        Menu() {
                            Button("Pane on right",
                                   action: { layout.addPane(to: child, for: .horizontal) })
                            Button("Panel on bottom",
                                   action: { layout.addPane(to: child, for: .vertical) })
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                
            case is CTWindowLayout:
                CTLayoutView(layout: child as! CTWindowLayout, content: content)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            default: fatalError("Child is not CTWindowLayout or CTWindowView. This should never happen. \(child)")
            }
        }
        
    }
}

public enum CTLayoutDefenition {
    case vStack(children: [CTLayoutDefenition])
    case hStack(children: [CTLayoutDefenition])
    case pane
    
    func cunstructLayout(parent: CTWindowLayout?) -> CTWindowLayoutProtocol {
        switch self {
        case .vStack(let children):
            let layout = CTWindowLayout(parent: parent, orientation: .vertical, children: [])
            layout.children.append(contentsOf: children.map({ $0.cunstructLayout(parent: layout) }))
            return layout
            
        case .hStack(let children):
            let layout = CTWindowLayout(parent: parent, orientation: .horizontal, children: [])
            layout.children.append(contentsOf: children.map({ $0.cunstructLayout(parent: layout) }))
            return layout
            
        case .pane:
            return CTWindowPane()
        }
    }
}
