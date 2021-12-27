//
//  Tabbar.swift
//  Fantline
//
//  Created by Liseami on 2021/12/14.
//

import SwiftUI

struct Tabbar: View {
    @ObservedObject var uistate = UIState.shared
    
    var body: some View {
        
        HStack{
            ForEach(uistate.appIndexs,id: \.self){ tabitem in
                Button {
                    uistate.appIndex = tabitem
                } label: {
                    Rectangle().hidden()
                        .overlay(ICON(sysname: tabitem.iconname,fcolor: tabitem == uistate.appIndex ?  .fc1 : .fc2, size: 20))
                }

              
            }
            Button {
                uistate.showLaperView.toggle()
            } label: {
                Rectangle()
                    .hidden()
                    .overlay(ICON(sysname: "square.and.pencil",fcolor: .fc2,size: 20))
            }

        }
        .frame( height: 44, alignment: .center)
        .overlay(Divider().opacity(0.3),alignment: .top)
        .background(Color.Card.ignoresSafeArea())
        .MoveTo(.bottomCenter)
    
        
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }

}
