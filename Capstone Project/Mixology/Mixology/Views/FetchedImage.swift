//
//  FetchedImage.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-28.
//

import SwiftUI

struct FetchedImage: View {

    let url: URL?
    @StateObject private var imageFetcher = ImageFetcher()

    var body: some View {
        VStack {
            if let uiImage = imageFetcher.fetchedImage {
                Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                            .frame(height: 70)
                           .cornerRadius(3.0)
            } else {
                ProgressView()
            }
        }.task {
            await downloadImage()
        }
    }

    private func downloadImage() async {
        do {
            try await imageFetcher.fetchImage(url)
        } catch {
            print(error)
        }
    }

}
