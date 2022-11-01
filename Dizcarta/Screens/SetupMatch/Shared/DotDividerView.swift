//
//  DotDividerView.swift
//  Dizcarta
//
//  Created by Felipe Brigagão de Almeida on 31/10/22.
//

import SwiftUI

struct DotDividerView: View {
  var body: some View {
    LineDot()
      .stroke(style: StrokeStyle(lineWidth: 3, dash: [5]))
      .foregroundColor(Color(.textFieldBackgroundColor))
      .frame(height: 1)
      .padding(-20)
  }
}

struct LineDot: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: rect.width, y: 0))
    return path
  }
}

struct DotDividerView_Previews: PreviewProvider {
  static var previews: some View {
    DotDividerView()
      .preferredColorScheme(.light)
      .previewLayout(.sizeThatFits)
  }
}
