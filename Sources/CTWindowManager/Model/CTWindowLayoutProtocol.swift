//
//  CTWindowLayoutProtocol.swift
//  CTWindow
//
//  Created by Nathanael Johnson on 12/16/25.
//

import SwiftUI

protocol CTWindowLayoutProtocol: Identifiable, AnyObject {
    var id: UUID { get }
    var parent: CTWindowLayout? { get set }
}
