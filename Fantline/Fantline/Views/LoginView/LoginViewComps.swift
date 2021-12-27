//
//  LoginViewComps.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/27.
//

import SwiftUI

struct TitleAndSubline: View {
    let title : String
    let subline : String
    
    init(title : String,subline : String){
        self.title = title
        self.subline = subline
    }
    var body: some View {
        VStack(spacing:12){
            Text(title)
                .mFont(style: .LargeTitle_22_B,color: .fc1)
            Text(subline)
                .mFont(style: .Body_15_R,color: .fc2)
        }
    }
}

struct LoginViewComps_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.BackGround.ignoresSafeArea()
            TitleAndSubline(title: "TitleTitleTitle", subline: "sublinesublinesubline")
        }
    }
}
