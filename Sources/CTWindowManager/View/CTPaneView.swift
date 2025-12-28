//
//  CTWindowView.swift
//  CTWindow
//
//  Created by Nathanael Johnson on 12/16/25.
//

import SwiftUI

struct CTPaneView<Selection: CTTabSelection, Content: View>: View {
    
    let pane: CTWindowPane
    let content: (_ selection: Selection) -> Content
    
    @State var selection: Selection = Selection.allCases.first!
    
    var body: some View {
        content(selection)
            .frame(minWidth: 50, minHeight: 50)
            .paneBarItems {
                Button {
                    pane.parent!.removeChild(pane)
                } label: {
                    Image(systemName: "xmark")
                }
                
                Menu() {
                    Button("Pane on right",
                           action: { pane.parent!.addPane(to: pane, for: .horizontal) })
                    Button("Panel on bottom",
                           action: { pane.parent!.addPane(to: pane, for: .vertical) })
                } label: {
                    Image(systemName: "plus")
                }
                
                Spacer()
                
                Menu() {
                    ForEach(Array(Selection.allCases)) { tab in
                        Button(tab.name) {
                            selection = tab
                        }
                    }
                } label: {
                    Image(systemName: "rectangle.on.rectangle")
                }
            }
    }
}

public protocol CTTabSelection: CaseIterable, Identifiable {
    var name: String { get }
}
