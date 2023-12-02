//
//  OnboardingItem.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-29.
//

import Foundation
import SwiftUI

struct OnboardingItemModel: Identifiable {
  var id: Int
  var title: String
  var content: String
  var sfSymbol: String
  var gradientColors: [Color]
}
