//
//  RestaurantDetailView.swift
//  BottomSheet
//
//  Created by alex on 2022/10/20.
//

import SwiftUI

struct RestaurantDetailView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct RestaurantDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantDetailView2(restaurant: restaurants[0])
//            .background(Color.black.opacity(0.3))
//            .edgesIgnoringSafeArea(.all)
//    }
//}

struct RestaurantDetailView1: View {
    let restaurant: Restaurant

    var body: some View {
        VStack {
            Spacer()
            
            HandleBar()
            TitleBar()
            HeaderView(restaurant: self.restaurant)
            
            DetailInfoView(icon: "map", info: self.restaurant.location)
                .padding(.top)
            
            DetailInfoView(icon: "phone", info: self.restaurant.phone)
            
            DetailInfoView(icon: nil, info: self.restaurant.description)
                .padding(.top)

        }
        .background(Color.white)
        .cornerRadius(10, antialiased: true)
    }
}

struct RestaurantDetailView2: View {
    let restaurant: Restaurant
    
    @GestureState private var dragState = DragState.inactive
    @State private var positionOffset: CGFloat = 0.0
    @State private var viewState = ViewState.half
    @State private var scrollOffset: CGFloat = 0.0
    
    @Binding var isShow: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
            
                HandleBar()
            
                ScrollView(.vertical) {
                    GeometryReader { scrollViewProxy in
                        Color.clear.preference(key: ScrollOffsetKey.self, value: scrollViewProxy.frame(in: .named("scrollview")).minY)
                    }
                    .frame(height: 0)
                    
                    TitleBar()
                
                    HeaderView(restaurant: self.restaurant)
                
                    DetailInfoView(icon: "map", info: self.restaurant.location)
                        .padding(.top)
                    
                    DetailInfoView(icon: "phone", info: self.restaurant.phone)
                    
                    DetailInfoView(icon: nil, info: self.restaurant.description)
                        .padding(.top)
                        .padding(.bottom, 100)
                }
                .background(Color.white)
                .cornerRadius(10, antialiased: true)
                .disabled(self.viewState == .half && self.dragState.translation.height == 0)
                .coordinateSpace(name: "scrollview")
            }
            // .offset(y: 300)
            // .offset(y: geometry.size.height/2)
            .offset(y: geometry.size.height/2 + self.dragState.translation.height + self.positionOffset)
            .offset(y: self.scrollOffset)
            .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0))
            .edgesIgnoringSafeArea(.all)
            .gesture(
                DragGesture()
                    .updating(self.$dragState, body: { (value, state, transaction) in
                        state = .dragging(translation: value.translation)
                    })
                    .onEnded({ (value) in
                        if self.viewState == .half {
                            // Threshold #1
                            // Slide up and when it goes beyond the threshold change the view state to fully opened by updating
                            // the position offset
                            if value.translation.height < -geometry.size.height * 0.25 {
                                self.positionOffset = -geometry.size.height/2 + 50
                                self.viewState = .full
                            }
                            // Threshold #2
                            // Slide down and when it goes pass the threshold dismiss the view by setting isShow to false
                            if value.translation.height > geometry.size.height * 0.3 {
                                self.isShow = false
                            }
                        }
                    })
            )
            .onPreferenceChange(ScrollOffsetKey.self) { value in
                if self.viewState == .full {
                    self.scrollOffset = value > 0 ? value : 0
                    
                    if self.scrollOffset > 120 {
                        self.positionOffset = 0
                        self.scrollOffset = 0
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.viewState = .half
                        }
                    }
                }
            }
        }
    }
}


