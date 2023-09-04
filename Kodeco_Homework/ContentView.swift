//
//  ContentView.swift
//  Kodeco_Homework Assignemnt 01
//
//  Created by Chris Olsen on 2023-08-31.
//

import SwiftUI

struct ContentView: View {
  
  @State private var model: ViewModel = ViewModel()
  
  var body: some View {
    VStack {
      Text("Color Picker")
        .font(.largeTitle)
      
      RoundedRectangle(cornerRadius: 5)
        .aspectRatio(1.11, contentMode: .fit)
        .foregroundColor(model.currentColor)
      
      Spacer()
      
      VStack{
        Text("Red")
        HStack{
          Slider(value: $model.redSliderValue, in: 0...255, step: 1)
          Text("\(model.redSliderValue.formatted())")
        }
        Text("Green")
        HStack{
          Slider(value: $model.greenSliderValue, in: 0...255, step: 1)
          Text("\(model.greenSliderValue.formatted())")
        }
        Text("Blue")
        HStack{
          Slider(value: $model.blueSliderValue, in: 0...255, step: 1)
          Text("\(model.blueSliderValue.formatted())")
        }
      }
      
      Spacer()
      
      Button("Set Color") {
        model.updateRectangleColor()
      }
    }
    .padding()
  }
}

struct ViewModel {
  var redSliderValue: Double = 99
  var greenSliderValue: Double = 40
  var blueSliderValue: Double = 75
  var currentColor: Color?
  
  init() {
    updateRectangleColor()
  }
  
  mutating func updateRectangleColor() {
    let tempRedValue = redSliderValue / 255
    let tempGreenValue = greenSliderValue / 255
    let tempBlueValue = blueSliderValue / 255
    
    let tempColor = Color(red: tempRedValue, green: tempGreenValue, blue: tempBlueValue)
    currentColor = tempColor
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
