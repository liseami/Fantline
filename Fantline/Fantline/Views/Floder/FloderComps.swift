//
//  FloderComps.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/15.
//

import SwiftUI


struct OfficalFloderItem : View {
    var text : String
    var iconname : String
    var action : ()->()
    
    init(text : String,iconname : String, action : @escaping()->()){
        self.text = text
        self.iconname = iconname
        self.action = action
    }
    var body: some View{
        Button {
            action()
        } label: {
            VStack{
                ICON(name : iconname)
                Text(text)
            }
            .PF_Leading()
            .frame(width: GoldenH * 1.618 * 1.618)
            .background(Color.BackGround.clipShape(RoundedRectangle(cornerRadius:12, style: .continuous)))
        }

    
    }
}

struct FloderItem : View {
    var text : String
    var nums : String
    var action : ()->()
    
    init(_ text : String,nums : String,  action : @escaping ()->()){
        self.text = text
        self.nums = nums
        self.action = action
    }
    var body: some View{
        Button {
            action()
        } label: {
            HStack{
                Text(text)
                Text(nums)
            }
            .frame( height: GoldenH)
            .background(Color.BackGround.clipShape(RoundedRectangle(cornerRadius:12, style: .continuous)))
        }

       
    }
}
