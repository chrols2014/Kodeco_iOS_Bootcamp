//
//  TagCapsuleView.swift
//  BevvyTest
//
//  Created by Chris Olsen on 2023-11-23.
//

import SwiftUI

struct TagCapsuleView: View {
  var tag: String
    var body: some View {
      Text(tag)
        .font(.footnote)
        .padding(.horizontal, 7)
        .background(.green)
        .clipShape(Capsule())
    }
}

#Preview {
  TagCapsuleView(tag: "Test")
}
