//
//  OnboardingData.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-29.
//

import Foundation
import SwiftUI

let onboardingContent: [OnboardingItemModel] = [

  OnboardingItemModel(id: 0, title: "Welcome...",
                    content: "Looking for something good to drink? You're in the right place!",
                    sfSymbol: "wineglass",
                    gradientColors: [Color.blue, Color.cyan]),
  OnboardingItemModel(id: 1, title: "Find a new favourite...",
                    content: "Never forget how to make your best bevvy by saving you list of favs!",
                    sfSymbol: "star.circle",
                    gradientColors: [Color.blue, Color.cyan]),
  OnboardingItemModel(id: 2, title: "No Internet? No Problem...",
                    content: "Your favourites are automatically save for offline use.",
                    sfSymbol: "folder.badge.plus",
                    gradientColors: [Color.blue, Color.cyan]),



]
