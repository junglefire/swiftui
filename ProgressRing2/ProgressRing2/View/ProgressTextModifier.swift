//
//  ProgressTextModifier.swift
//  ProgressRing2
//
//  Created by alex on 2022/10/30.
//

import SwiftUI

struct ProgressTextModifier: AnimatableModifier {
    var progress: Double = 0.0
    var textColor: Color = .primary
    
    private var progressText: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.percentSymbol = "%"
        return formatter.string(from: NSNumber(value: progress)) ?? ""
    }
    
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Text(progressText)
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
                    .animation(nil)
            )
    }
}

extension View {
    func animatableProgressText(progress: Double, textColor: Color = Color.primary) -> some View {
        self.modifier(ProgressTextModifier(progress: progress, textColor: textColor))
    }
}

struct ProgressBar_Library: LibraryContentProvider {
    @LibraryContentBuilder var views: [LibraryItem] {
        LibraryItem(
            ProgressRingView(
                progress: .constant(1.0),
                thickness: 12.0,
                width: 130.0,
                gradient: Gradient(colors: [.darkYellow, .lightYellow])
            ),
            title: "Progress Ring",
            category: .control
        )
        
        LibraryItem(
            ProgressRingView(
                progress: .constant(1.0),
                thickness: 30.0,
                width: 250.0,
                gradient: Gradient(colors: [.darkPurple, .lightYellow])
            ),
            title: "Progress Ring - Bigger",
            category: .control
        )
    }
    
    @LibraryContentBuilder
    func modifiers(base: Circle) -> [LibraryItem] {
        LibraryItem(base.animatableProgressText(progress: 1.0), title: "Progress Indicator", category: .control)
    }
}

//struct ProgressTextModifier_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressTextModifier()
//    }
//}
