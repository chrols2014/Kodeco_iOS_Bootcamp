import SwiftUI

struct ColorPickerSquare: View {
  @Binding var squareColor: Color
  
  
  var body: some View {
    RoundedRectangle(cornerRadius: 0)
      .frame(maxWidth: Constants.GeneralUI.colorPickerSquareMaxDimensionsHW,
             maxHeight: Constants.GeneralUI.colorPickerSquareMaxDimensionsHW)
      .foregroundColor(squareColor)
      .overlay(Rectangle()
        .fill(.clear)
        .stroke(.thinMaterial,
                lineWidth: Constants.GeneralUI.colorPickerSquareOverlayLineWidth))
      .padding(.bottom, Constants.GeneralUI.generalPadding)
  }
}

#Preview {
  ColorPickerSquare(squareColor: .constant(.red))
}
