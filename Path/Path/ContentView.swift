//
//  ContentView.swift
//  Path
//
//  Created by alex on 2022/10/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // CircleView1()
            // ArcsView1()
            // CircleView2()
            // ArcsView2()
            PieView()
        }

//        Button(action: {
//            // 執⾏動作
//        }) {
//            Text("Test")
//                .font(.system(.title, design: .rounded))
//                .bold()
//                .foregroundColor(.white)
//                .frame(width: 250, height: 50)
//                .background(Dome().fill(Color.red))
//        }
        
    }
}

struct CircleView1: View {
    var body: some View {
        Path() { path in
            path.move(to: CGPoint(x: 20, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 200))
            path.addLine(to: CGPoint(x: 20, y: 200))
            path.closeSubpath()
        }
        .stroke(.green, lineWidth: 10)
    }
}

struct ArcsView1: View {
    var body: some View {
        Path() { path in
            path.move(to: CGPoint(x: 20, y: 60))
            path.addLine(to: CGPoint(x: 40, y: 60))
            path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
            path.addLine(to: CGPoint(x: 230, y: 60))
            path.addLine(to: CGPoint(x: 230, y: 100))
            path.addLine(to: CGPoint(x: 20, y: 100))
        }
        .fill(Color.purple)
    }
}

struct CircleView2: View {
    var body: some View {
        ZStack {
            Path() { path in
                path.move(to: CGPoint(x: 20, y: 60))
                path.addLine(to: CGPoint(x: 40, y: 60))
                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0 ))
                path.addLine(to: CGPoint(x: 230, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 100))
                path.addLine(to: CGPoint(x: 20, y: 100))
            }
            .fill(Color.purple)
            
            Path() { path in
                path.move(to: CGPoint(x: 20, y: 60))
                path.addLine(to: CGPoint(x: 40, y: 60))
                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                path.addLine(to: CGPoint(x: 230, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 100))
                path.addLine(to: CGPoint(x: 20, y: 100))
                path.closeSubpath()
            }
            .stroke(Color.black, lineWidth: 5)
        }
    }
}

struct ArcsView2: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 200))
            path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
        }
        .fill(.green)
    }
}

struct PieView: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(0), endAngle: .degrees(190), clockwise: true)
            }
            .fill(.yellow)
            
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(190), endAngle: .degrees(110), clockwise: true)
            }
            .fill(.teal)
            
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(110), endAngle: .degrees(90), clockwise: true)
            }
            .fill(.blue)
            
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(90), endAngle: .degrees(360), clockwise: true)
            }
            .fill(.purple)
            .offset(x: 10, y: 10)
            
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(90), endAngle: .degrees(360), clockwise: true)
                path.closeSubpath()
            }
            .stroke(Color(red: 52/255, green: 52/255, blue: 122/255), lineWidth: 10)
            .offset(x: 10, y: 10)
            .overlay(
                Text("25%")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .offset(x: 80, y: -110)
                
            )
        }
    }
}

struct Dome: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint(x: rect.size.width/2, y: -(rect.size.width * 0.1)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        return path
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
