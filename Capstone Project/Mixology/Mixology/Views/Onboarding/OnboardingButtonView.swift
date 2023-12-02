//
//  OnboardingButtonView.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-29.
//

import SwiftUI

struct OnboardingButtonView: View {
  // MARK: - PROPERTIES

  @AppStorage("isOnboarding") var isOnboarding: Bool?

  // MARK: - BODY

  var body: some View {
    Button(action: {
      isOnboarding = false
    }) {
      HStack(spacing: 8) {
        Text("Cheers! 🥂")

        Image(systemName: "arrow.right.circle")
          .imageScale(.large)
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 10)
      .background(
        Capsule().strokeBorder(.accent, lineWidth: 1.25)
      )
    } //: BUTTON
    .accentColor(.accent)
  }
}

#Preview {
  OnboardingButtonView()
    .preferredColorScheme(.dark)
    .previewLayout(.sizeThatFits)
}
