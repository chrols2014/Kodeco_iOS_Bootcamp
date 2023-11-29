//
//  RemoteImage.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-28.
//

import SwiftUI

struct RemoteImage: View {

    var image : Image?

    var body: some View {
        image?.resizable() ?? Image("avatar-placeholder").resizable()
    }
}

#Preview {
    RemoteImage()
}
