//
//  Laper.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/26.
//

import SwiftUI
struct LaperDocCard : View {
    let title : String
    let subline : String
    
    var body: some View{
        VStack(spacing:0){
            Image("15")
                .resizable()
                .scaledToFill()
                .frame( height: (SW - 32) * 0.618 * 0.618,alignment: .top)
                .clipped()
                    VStack(alignment: .leading, spacing: 2){
                        Text(title)
                            .lineLimit(1)
                            .mFont(style: .Title_17_B,color: .fc1)
                            .PF_Leading()
                        Text(subline)
                            .mFont(style: .Body_15_R,color: .fc2)
                    }
                    .padding(.all,12)
        }
        .frame(width: SW * 0.93)
        .cornerRadius(4)
        .overlay(RoundedRectangle(cornerRadius: 4, style: .continuous).stroke(lineWidth: 0.5).foregroundColor(.fc3.opacity(0.6)))
    }
}

struct LaperDocCard_Previews: PreviewProvider {
    static var previews: some View {
        
        LaperDocCard(title: "LaperDocCard", subline: "LaperDocCardSubline")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
