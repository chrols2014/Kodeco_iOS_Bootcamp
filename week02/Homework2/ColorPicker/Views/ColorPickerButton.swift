import SwiftUI

struct ColorPickerButton: View {
  @Binding var foreGroundColor: Color
  @Binding var redValue: Double
  @Binding var greenValue: Double
  @Binding var blueValue: Double
  
  var body: some View {
    Button("Set Color") {
      foreGroundColor = Color(red: redValue / Constants.GeneralUI.colorMaxValueInt,
                              green: greenValue / Constants.GeneralUI.colorMaxValueInt,
                              blue: blueValue / Constants.GeneralUI.colorMaxValueInt)
    }
    .buttonStyle(.borderedProminent)
    .controlSize(.large)
    .overlay(
      RoundedRectangle(cornerRadius: Constants.GeneralUI.colorButtonCornerRadius)
        .stroke(.white, lineWidth: Constants.GeneralUI.colorButtonStrokeWidth)
    )
  }
}

#Preview {
  ColorPickerButton(foreGroundColor: .constant(.white), redValue: .constant(0.0), greenValue: .constant(0.0), blueValue: .constant(0.0))
}
