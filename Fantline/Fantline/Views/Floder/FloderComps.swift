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
            VStack(alignment: .leading, spacing: 12){
                ICON(name : iconname)
                Text(text)
                    .mFont(style: .Body_15_B,color: .fc1)
            }
            .frame(height: GoldenH * 1.618)
            .padding(.all,12)
            .PF_Leading()
            .background(Color.Card.clipShape(RoundedRectangle(cornerRadius:12, style: .continuous)))
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
                    .mFont(style: .Body_15_B,color: .fc1)
                Spacer()
                Text(nums)
                    .mFont(style: .Body_15_B,color: .fc2)
                ICON(sysname: "chevron.right",fcolor: .fc2)
            }
            .frame( height: GoldenH)
            .padding(.all,12)
            .background(Color.Card.clipShape(RoundedRectangle(cornerRadius:12, style: .continuous)))

        }

       
    }
}

struct OfficalFloderItem_Previews: PreviewProvider {
    static var previews: some View {
        
        LibrayView()
        OfficalFloderItem(text: "2323", iconname: "Star", action: {
            
        })
            .previewLayout(.sizeThatFits)
        FloderItem("232", nums: "2323", action: {
            
        })
            .previewLayout(.sizeThatFits)
    }
}
