//
//  ProgressRingView.swift
//  ProgressRing2
//
//  Created by alex on 2022/10/30.
//

import SwiftUI

struct ProgressRingView: View {
    @Binding var progress: Double
    
    var thickness: CGFloat = 30.0
    var width: CGFloat = 250.0
    var gradient = Gradient(colors: [.darkPurple, .lightYellow])
    var startAngle = -90.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: thickness)
            
            RingShape(progress: progress, thickness: thickness)
                .fill(
                    AngularGradient(
                        gradient: gradient,
                        center: .center,
                        startAngle: .degrees(startAngle),
                        endAngle: .degrees(360 * progress + startAngle)
                    )
                )
                .animatableProgressText(progress: progress)
                        
            RingTip(progress: progress, startAngle: startAngle, ringRadius: radius)
                .frame(width: thickness, height: thickness)
                .foregroundColor(progress > 0.96 ? gradient.stops[1].color : Color.clear)
                .shadow(
                    color: progress > 0.96 ? Color.black.opacity(0.15) : Color.clear,
                    radius: 2,
                    x: ringTipShadowOffset.x,
                    y: ringTipShadowOffset.y
                )
        }
        .frame(width: width, height: width, alignment: .center)
        .animation(.easeInOut(duration: 1.0), value: progress)
    }
    
    private var radius: Double {
        Double(width / 2)
    }
    
    private var ringTipShadowOffset: CGPoint {
        let shadowPosition = ringTipPosition(progress: progress + 0.01)
        let circlePosition = ringTipPosition(progress: progress)
        return CGPoint(x: shadowPosition.x - circlePosition.x, y: shadowPosition.y - circlePosition.y)
    }
    
    private func ringTipPosition(progress: Double) -> CGPoint {
        let angle = 360 * progress + startAngle
        let angleInRadian = angle * .pi / 180
        return CGPoint(x: radius * cos(angleInRadian), y: radius * sin(angleInRadian))
    }
}

//struct ProgressRingView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressRingView(progress: .constant(0.5)).previewLayout(.fixed(width: 300, height: 300))
//    }
//}
