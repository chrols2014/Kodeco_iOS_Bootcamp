/// Copyright (c) 2023 Kodeco Inc.
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ContentView: View {
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = 0
  @State private var greenColor: Double = 0
  @State private var blueColor: Double = 0
  @State private var squareColor = Color(red: 0, green: 0, blue: 0)
  
  var body: some View {
    ZStack {
      if verticalSizeClass == .regular && horizontalSizeClass == .compact {
        VStack {
          Text("Color Picker")
            .font(.largeTitle)
          ColorPickerSquare(squareColor: $squareColor)
          
          ColorSliderView(colorValue: $redColor, colorSelection: "Red", sliderTint: .red)
          ColorSliderView(colorValue: $greenColor, colorSelection: "Green", sliderTint: .green)
          ColorSliderView(colorValue: $blueColor, colorSelection: "Blue", sliderTint: .blue)
          
          ColorPickerButton(foreGroundColor: $squareColor, redValue: $redColor, greenValue: $greenColor, blueValue: $blueColor)
        }
      } else {
        HStack {
          VStack {
            Text("Color Picker")
              .font(.largeTitle)
            ColorPickerSquare(squareColor: $squareColor)
          }
          VStack {
            ColorSliderView(colorValue: $redColor, colorSelection: "Red", sliderTint: .red)
            ColorSliderView(colorValue: $greenColor, colorSelection: "Green", sliderTint: .green)
            ColorSliderView(colorValue: $blueColor, colorSelection: "Blue", sliderTint: .blue)
            
            ColorPickerButton(foreGroundColor: $squareColor, redValue: $redColor, greenValue: $greenColor, blueValue: $blueColor)
          }
          .padding()
        }
      }
    }
    .background(Color("Background"))
    .padding(Constants.GeneralUI.generalPadding)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
