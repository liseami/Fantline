//
//  Buttons.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/25.
//

import SwiftUI



struct MainButton : View{
    var title : String
    var color : Color = .MainColor
    let action : ()->()
    init(title : String,color : Color = .MainColor,action: @escaping ()->()){
        self.title = title
        self.color = color
        self.action = action
    }
    var body: some View{
        
        Button {
            action()
            madasoft()
        } label: {
            Text(title)
                .mFont(style: .Title_17_B,color: .white)
        }
        .buttonStyle(MainButtonStyle(color))

       
     
        
    }
}

struct MainButtonStyle : ButtonStyle{
    let color : Color
    init(_ color : Color = .MainColor){
        self.color = color
    }
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
            .background(color)
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

