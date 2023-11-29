//
//  OnboardingItem.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-29.
//

import Foundation


struct OnboardingItem: Codable, Identifiable{
  var id = UUID()
  var title: String?
  var content: String?
  var sfSymbol: String?



}
