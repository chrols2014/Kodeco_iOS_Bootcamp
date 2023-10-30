//
//  EmptyStateView.swift
//  Homework9
//
//  Created by Chris Olsen on 2023-10-30.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
      VStack {
        ContentUnavailableView("Enter a search term...", systemImage: "magnifyingglass.circle.fill")
          .foregroundColor(.black)
          .symbolRenderingMode(.multicolor)
          .symbolEffect(.pulse)
          
      }
    }
}

#Preview {
    EmptyStateView()
}
