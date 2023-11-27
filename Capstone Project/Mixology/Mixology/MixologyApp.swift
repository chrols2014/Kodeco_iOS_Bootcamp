//
//  MixologyApp.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-27.
//

import SwiftUI

@main
struct MixologyApp: App {
    var body: some Scene {
        WindowGroup {
          ContentView(drinkStore: DrinkStore())
        }
    }
}
