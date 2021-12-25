//
//  Buttons.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/25.
//

import SwiftUI



struct MainButton : View{
    var title : String
    let avtion : ()->()
    var body: some View{
        
        Button {
            avtion()
            madasoft()
        } label: {
            Text(title)
                .mFont(style: .Title_17_B,color: .white)
        }
        .buttonStyle(MainButtonStyle())

       
     
        
    }
}

struct MainButtonStyle : ButtonStyle{
    func makeBody(configuration: Configuration) -> some
    View {
        let isPressed = configuration.isPressed
        HStack{
            Spacer()
            configuration
                .label
            Spacer()
        }
        .frame( height: GoldenH)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 3, style: .continuous))
            .opacity(isPressed ? 0.8 : 1)
            .scaleEffect(isPressed ? 0.98 : 1)
            
    }
}




struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(title: "MainButton"){}
            .previewLayout(.sizeThatFits)
    }
}

