//
//  FloderComps.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/15.
//

import SwiftUI


struct FilmListFloder : View {
    var text : String
    var imagename : String
    var style : UIState.FilmListStyle
    @Namespace var filmlistanimation
    var action : ()->()
    
    init(text : String,imagename : String ,style :UIState.FilmListStyle ,  action : @escaping()->()){
        self.text = text
        self.style = style
        self.action = action
        self.imagename = imagename
    }
    
    var body: some View{
       
        
        Group{
            switch style {
            case .block:
                VStack(alignment: .leading, spacing: 6){
                    Image(imagename)
                        .resizable()
                        .scaledToFill()
                        .frame(width: (SW - 48)/2, height: (SW - 48)/2,alignment: .top)
                        .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
                    Text(text)
                        .mFont(style: .Body_15_B,color: .fc1)
                    Text(text)
                        .mFont(style: .Body_12_R,color: .fc2)
                }
               
            
       
               
            case .list:
                HStack(alignment: .center, spacing: 12){
                    Image(imagename)
                        .resizable()
                        .scaledToFill()
                        .frame(width: GoldenH * 1.618, height: GoldenH * 1.618,alignment: .top)
                        .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
                    VStack(alignment: .leading,  spacing:4){
                        Text(text)
                            .mFont(style: .Body_15_B,color: .fc1)
                        Text(text)
                            .mFont(style: .Body_12_R,color: .fc2)
                    }
                    
                    Spacer()
                }
          
            }
        }
      
        
            .onTapGesture {
                action()
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
        
      
        ZStack{
            Color.BackGround.ignoresSafeArea()
            LibrayView()
        }
     
        ZStack{
            Color.BackGround.ignoresSafeArea()
            VStack{
                FilmListFloder(text: "2323",  imagename: "3",style: .list, action: {
                    
                })
                FilmListFloder(text: "2323",  imagename: "3",style: .list, action: {
                    
                })
                FilmListFloder(text: "2323",  imagename: "3",style: .list, action: {
                    
                })
            }
      
        }
       
            
        FloderItem("232", nums: "2323", action: {
            
        })
            .previewLayout(.sizeThatFits)
    }
}
