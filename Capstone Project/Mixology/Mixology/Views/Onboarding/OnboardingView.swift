//
//  OnboardingView.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-29.
//

import SwiftUI

struct OnboardingView: View {
  let onboardingItem: OnboardingItemModel
  @State private var isAnimating: Bool = false
  var body: some View {

    ZStack {
      VStack(spacing: 20) {
        Spacer()
        Image(systemName: onboardingItem.sfSymbol)
          .symbolRenderingMode(.monochrome)
          .foregroundStyle(.purple)

          .symbolEffect(.bounce.down, value: isAnimating)
          .padding(.bottom, 50)
          .font(.system(size: 120, weight: .bold))
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)



        Text(onboardingItem.title)
          .foregroundColor(.accent)
          .font(.title)
          .fontWeight(.heavy)
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)

        Text(onboardingItem.content)
          .foregroundColor(.accent.opacity(0.8))
          .multilineTextAlignment(.center)
          .padding(.horizontal, 16)
          .frame(maxWidth: 480)

    Spacer()
        if onboardingItem.id == 2 {
          OnboardingButtonView()
          Spacer()
        }



      }
      .padding(.bottom, 50)
    }
    .onAppear {
      withAnimation {
        isAnimating = true
      }
    }
    .onDisappear {
      isAnimating = false
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    .background(LinearGradient(gradient: Gradient(colors: onboardingItem.gradientColors), startPoint: .top, endPoint: .bottom))
    //.background(.regularMaterial)
    .cornerRadius(20)
    .padding(.horizontal, 20)
  }
}

#Preview {
  OnboardingView(onboardingItem: OnboardingItemModel(id: 0, title: "Test Title", content: "Test Content", sfSymbol: "star.fill", gradientColors: [.black, .black]))
}
