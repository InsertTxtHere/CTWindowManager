//
//  CTWindowLayoutView.swift
//  CTWindow
//
//  Created by Nathanael Johnson on 12/17/25.
//

import SwiftUI

struct CTLayoutView<Content: View>: View {
    
    var layout: CTWindowLayout
    
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
                VStack {
                    paneBarView(child: child)
                    CTPaneView(content: content)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
            case is CTWindowLayout:
                CTLayoutView(layout: child as! CTWindowLayout, content: content)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            default: fatalError("Child is not CTWindowLayout or CTWindowView. This should never happen. \(child)")
            }
        }
        
    }
    
    @ViewBuilder
    func paneBarView(child: any CTWindowLayoutProtocol) -> some View {
        HStack {
            Button {
                layout.removeChild(child)
            } label: {
                Image(systemName: "xmark")
                    .padding(5)
                    .background(.tertiary, in: .rect)
            }.buttonStyle(.plain)

            Spacer()
            
            Menu() {
                Button("Pane on right",
                       action: { layout.addPane(to: child, for: .horizontal) })
                Button("Panel on bottom",
                       action: { layout.addPane(to: child, for: .vertical) })
            } label: {
                Image(systemName: "plus")
                    .padding(5)
                    .background(.tertiary, in: .rect)
            }.buttonStyle(.plain)
            
        }.background(.tertiary, in: .rect)
    }
}
