//
//  logoNavBarView.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-30.
//

import SwiftUI

struct LogoNavBarItemView: View {
  var body: some View {
    Image("MixologyLogo")
      .renderingMode(.template)
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(height: 100)
      .shadow(color: .pink, radius: 2)
      .foregroundColor(.pink)
  }
}


#Preview {
  LogoNavBarItemView()
}
