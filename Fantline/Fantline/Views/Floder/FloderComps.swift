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
    let isPro : Bool
    var action : ()->()
    
    init(text : String,iconname : String,isPro : Bool = false, action : @escaping()->()){
        self.text = text
        self.iconname = iconname
        self.action = action
        self.isPro = isPro
    }
    
    var body: some View{
       
            HStack(alignment: .center, spacing: 12){
                ICON(name : iconname,fcolor: .FilmBlue,size: 28)
                Text(text)
                    .mFont(style: .Title_17_B,color: .fc1)
                Text("Laper Pro")
                    .mFont(style: .Body_15_B,color: .FilmYellow)
                    .padding(.horizontal,4)
                    .padding(.vertical,2)
                    .background(Color.FilmYellow.opacity(0.1))
                    .cornerRadius(3)
                    .ifshow(isPro)
                Spacer()
                ICON(sysname: "chevron.right",fcolor: .fc3)
            }
            .frame(height: GoldenH)
            .background(Color.BackGround)
            .onTapGesture {
                action()
            }

//            .background(Color.Card.clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous)))

        

    
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
        
      
        ZStack{
            Color.BackGround.ignoresSafeArea()
            LibrayView()
        }
     
        OfficalFloderItem(text: "2323", iconname: "Star", action: {
            
        })
            .previewLayout(.sizeThatFits)
        FloderItem("232", nums: "2323", action: {
            
        })
            .previewLayout(.sizeThatFits)
    }
}
