//
//  ContentView.swift
//  Kodeco_Homework
//
//  Created by Chris Olsen on 2023-08-31.
//

import SwiftUI

struct ContentView: View {
  
  @State private var red : Float = 125
  @State private var green : Float = 125
  @State private var blue : Float = 125
  //  @State var computedColor: Color {
  //
  //    var tempColor = Color(red: 0.4627, green: 0.8392, blue: 1.0)
  //
  //    return tempColor
  //  }
  
  var body: some View {
    
    //need to work out how to get expected behaviour of only updating color when button clicked
    
    var compColor: Color {
      let tempRed = Double(red / 255)
      let tempGreen = Double(green / 255)
      let tempBlue = Double(blue / 255)
      
      let color = Color(red: tempRed, green: tempGreen, blue: tempBlue)
      
      return color
    }
    
    VStack {
      Spacer()
      Text("Color Picker").fontWeight(.heavy)
      Spacer()
      RoundedRectangle(cornerRadius: 0.5)
        .frame(width: 350, height: 350)
        .foregroundColor(compColor)
      
      Spacer()
      
      VStack{
        Text("Red")
        HStack{
          Slider(value: $red, in: 0...255, step: 1)
          Text("\(red)")
        }
        Text("Green")
        HStack{
          Slider(value: $green, in: 0...255, step: 1)
          Text("\(green)")
        }
        Text("Blue")
        HStack{
          Slider(value: $blue, in: 0...255, step: 1)
          Text("\(blue)")
        }
      }
      Spacer()
      Button("Set Color") {
//        let tempRed = Double(red / 255)
//        let tempGreen = Double(green / 255)
//        let tempBlue = Double(blue / 255)
//
//        let color = Color(red: tempRed, green: tempGreen, blue: tempBlue)
      }
      
    }
  }
  
  //make set color function
  
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
