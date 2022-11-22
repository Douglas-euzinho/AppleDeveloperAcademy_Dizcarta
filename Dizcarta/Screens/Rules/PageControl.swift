//
//  PageControl.swift
//  Dizcarta
//
//  Created by Douglas Figueirôa on 21/11/22.
//

import SwiftUI

struct PageControl: View {
    @Binding var currentPage: Int
    var pages: Int
    var circleMargin: CGFloat
    var circleDiameter: CGFloat
    
    private var circleRadius: CGFloat { circleDiameter / 2}
    private var pageIndex: CGFloat { CGFloat(currentPage - 1) }
    private var currentPosition: CGFloat {
            // Get the first circle position
            let stackWidth = circleDiameter * CGFloat(pages) + circleMargin * CGFloat(pages - 1)
            let halfStackWidth = stackWidth / 2
            let iniPosition = -halfStackWidth + circleRadius

            // Calculate the distance to get the next circle
            let distanceToNextPoint = circleDiameter + circleMargin

            // Use the pageIndex to get the current position
            return iniPosition + (pageIndex * distanceToNextPoint)
        }
    var body: some View {
        ZStack {
            HStack(spacing: circleMargin) {
                ForEach(0 ..< pages) { _ in
                    Circle()
                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 2, lineCap: .round))
                        .frame(width: circleDiameter, height: circleDiameter)
                }
            }
            Circle()
                .foregroundColor(.white)
                .frame(width: circleDiameter, height: circleDiameter)
                .offset(x: currentPosition)
        }
    }
}

//struct PageControl_Previews: PreviewProvider {
//    static var previews: some View {
//        PageControl()
//    }
//}
