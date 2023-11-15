import SwiftUI

struct ColorSliderView: View {
  @Binding var colorValue: Double
  var colorSelection: String
  var sliderTint: Color
  
    var body: some View {
      VStack {
        Text(colorSelection)
        HStack {
          Slider(value: $colorValue, in: 0...Constants.GeneralUI.colorMaxValueInt)
            .tint(sliderTint)
          Text("\(Int(colorValue.rounded()))")
        }
      }
    }
}

#Preview {
  ColorSliderView(colorValue: .constant(0.5), colorSelection: "Test", sliderTint: .red)
}
