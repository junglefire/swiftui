//
//  CenterModifier.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
