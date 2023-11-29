//
//  OnboardingScreenView.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-29.
//

import SwiftUI

struct OnboardingScreenView: View {
  var onBoardingData: [OnboardingItemModel] = onboardingContent
  var body: some View {


    TabView {
      ForEach(onBoardingData) { item in
        OnboardingView(onboardingItem: item)
      }

    }
    .tabViewStyle(.page)
    //.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    .padding(20)
  }
}

#Preview {
  OnboardingScreenView(onBoardingData: onboardingContent)
}
