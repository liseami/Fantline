//
//  PieCart.swift
//  Cashmix
//
//  Created by Liseami on 2021/11/13.
//



import SwiftUI
struct PieChart: View {
   
    
  var data: [Double] = [32,42,53]
  private var colors: [Color]  =  [.FilmYellow,.CashPink,.CashPinkLight]
  private let sliceOffset: Double = -.pi / 2
    
    init(_ themeID : Int = 0 ){
    self.colors = CashmixColorThemes[themeID]
    if themeID == 3 {self.data = [68,18,53] }
    }
    
  var body: some View {
    GeometryReader { geo in
      ZStack(alignment: .center) {
        ForEach(0 ..< data.count) { index in
          PieSlice(startAngle: startAngle(for: index), endAngle: endAngle(for: index))
            .fill(colors[index % colors.count])
          
          PieSlice(startAngle: startAngle(for: index), endAngle: endAngle(for: index))
            .stroke(Color.back1, lineWidth: 1)
            
//          PieSliceText(
//            title: "",
//            description: String(format: "", data[index])
//          )
//          .offset(textOffset(for: index, in: geo.size))
//          .zIndex(1)
        }
      }
    }
  }
  
  private func startAngle(for index: Int) -> Double {
    switch index {
      case 0:
        return sliceOffset
      default:
        let ratio: Double = data[..<index].reduce(0.0, +) / data.reduce(0.0, +)
        return sliceOffset + 2 * .pi * ratio
    }
  }
  
  private func endAngle(for index: Int) -> Double {
    switch index {
      case data.count - 1:
        return sliceOffset + 2 * .pi
      default:
        let ratio: Double = data[..<(index + 1)].reduce(0.0, +) / data.reduce(0.0, +)
        return sliceOffset + 2 * .pi * ratio
    }
  }
  
  private func textOffset(for index: Int, in size: CGSize) -> CGSize {
    let radius = min(size.width, size.height) / 3
    let dataRatio = (2 * data[..<index].reduce(0, +) + data[index]) / (2 * data.reduce(0, +))
    let angle = CGFloat(sliceOffset + 2 * .pi * dataRatio)
    return CGSize(width: radius * cos(angle), height: radius * sin(angle))
  }
}


struct PieSlice: Shape {
  let startAngle: Double
  let endAngle: Double
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let radius = min(rect.width, rect.height) / 2
    let alpha = CGFloat(startAngle)
    
    let center = CGPoint(
      x: rect.midX,
      y: rect.midY
    )
    
    path.move(to: center)
    
    path.addLine(
      to: CGPoint(
        x: center.x + cos(alpha) * radius,
        y: center.y + sin(alpha) * radius
      )
    )
    
    path.addArc(
      center: center,
      radius: radius,
      startAngle: Angle(radians: startAngle),
      endAngle: Angle(radians: endAngle),
      clockwise: false
    )
    
    path.closeSubpath()
    
    return path
  }
}
