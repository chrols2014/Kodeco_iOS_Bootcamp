import SwiftUI

struct ColourSliderView: View {
  
  @Binding var colorValue: Double
  var colorSelection: String
  
    var body: some View {
      VStack {
        Text(colorSelection)
        HStack {
          Slider(value: $colorValue, in: 0...255)
          Text("\(Int(colorValue.rounded()))")
        }
      }
    }
}

#Preview {
  ColourSliderView(colorValue: .constant(0.5), colorSelection: "Test")
}
