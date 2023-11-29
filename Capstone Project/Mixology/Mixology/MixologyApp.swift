//
//  MixologyApp.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-27.
//

import SwiftUI

@main
struct MixologyApp: App {
  @State private var networkMonitor = NetworkMonitor()
  @AppStorage("isOnboarding") var isOnboarding: Bool = true
  
  var body: some Scene {
    WindowGroup {
      if isOnboarding {
        OnboardingScreenView()
      } else {
        ContentView(drinkStore: DrinkStore())
          .environment(networkMonitor)
      }
      
    }
  }
}
