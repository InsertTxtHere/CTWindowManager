//
//  CTWindowPane.swift
//  CTWindow
//
//  Created by Nathanael Johnson on 12/17/25.
//

import SwiftUI

class CTWindowPane: CTWindowLayoutProtocol {
    let id: UUID = UUID()
    weak var parent: CTWindowLayout?
    
    init(parent: CTWindowLayout) {
        self.parent = parent
    }
}
