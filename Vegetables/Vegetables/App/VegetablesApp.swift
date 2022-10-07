//
//  VegetablesApp.swift
//  Vegetables
//
//  Created by alex on 2022/10/5.
//

import SwiftUI

@main
struct VegetablesApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
  
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView(vegetables: vegetablesData)
            }else {
                ContentView()
            }
        }
    }
}
