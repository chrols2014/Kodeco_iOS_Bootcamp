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
    
    VStack {
      Spacer()
      Text("Color Picker").fontWeight(.heavy)
      Spacer()
      RoundedRectangle(cornerRadius: 0.5)
        .frame(width: 350, height: 350)
      
      Spacer()
      VStack{
        Text("Red")
        Slider(value: $red, in: 0...255, step: 1)
        Text("Green")
        Slider(value: $green, in: 0...255, step: 1)
        Text("Blue")
        Slider(value: $blue, in: 0...255, step: 1)
        }
      Spacer()
      
      
    }
  }
  
  //make set color function
  
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
