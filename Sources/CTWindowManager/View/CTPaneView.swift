//
//  CTWindowView.swift
//  CTWindow
//
//  Created by Nathanael Johnson on 12/16/25.
//

import SwiftUI

struct CTPaneView<Content: View>: View {
    
    @State var content: () -> Content
    
    var body: some View {
        content()
            .frame(minWidth: 50, minHeight: 50)
    }
}


