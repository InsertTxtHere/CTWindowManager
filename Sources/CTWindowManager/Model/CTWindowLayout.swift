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
    
    func addChild(_ child: any CTWindowLayoutProtocol) {
        children.append(child)
    }
    
    func removeChild(_ child: any CTWindowLayoutProtocol) {
        children.removeAll(where: { $0.id == child.id })
        
        if children.count == 0 { parent?.removeChild(self) }
    }
    
    func addPane(to id: UUID, for orientation: Orientation) {
        if self.orientation == orientation {
            addChild(CTWindowPane())
        } else {
            let initeator = children.first(where: { $0.id == id })!
            children.removeAll { $0.id == id }
            
            addChild(CTWindowLayout(parent: self, orientation: orientation, children: [
                initeator,
                CTWindowPane()
            ]))
        }
    }
    
}
