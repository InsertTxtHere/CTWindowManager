//
//  CTWindowLayout.swift
//  CTWindow
//
//  Created by Nathanael Johnson on 12/16/25.
//

import SwiftUI

@Observable
class CTWindowLayout: CTWindowLayoutProtocol {
    
    enum Orientation {
        case horizontal
        case vertical
    }
    
    let id: UUID = UUID()
    
    let orientation: Orientation
    
    var children: [any CTWindowLayoutProtocol]
    
    weak var parent: CTWindowLayout?
    
    init(parent: CTWindowLayout?, orientation: Orientation, children: [any CTWindowLayoutProtocol]) {
        self.orientation = orientation
        self.children = children
        self.parent = parent
    }
    
    func removeChild(_ child: any CTWindowLayoutProtocol) {
        children.removeAll(where: { $0.id == child.id })
        
        if children.count == 0 { parent?.removeChild(self) }
    }
    
    private func addChild(_ child: CTWindowLayoutProtocol, at index: Int) {
        if index > children.count - 1 {
            children.append(child)
        } else {
            children.insert(child, at: index)
        }
    }
    
    func addPane(to pane: CTWindowLayoutProtocol, for orientation: Orientation) {
        if self.orientation == orientation {
            let index = children.firstIndex(where: { $0.id == pane.id })!
            addChild(CTWindowPane(parent: self), at: index + 1)
            
        } else {
            let index = children.firstIndex(where: { $0.id == pane.id })!
            children.removeAll { $0.id == pane.id }
            
            let newLayout = CTWindowLayout(parent: self, orientation: orientation, children: [])
            pane.parent = newLayout
            newLayout.children = [pane, CTWindowPane(parent: newLayout)]
            addChild(newLayout, at: index + 1)
        }
    }
    
}
