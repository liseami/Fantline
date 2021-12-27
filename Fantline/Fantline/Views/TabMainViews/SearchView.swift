//
//  SearchView.swift
//  Fantline
//
//  Created by Liseami on 2021/12/14.
//

import SwiftUI

struct SearchView: View {
    @State private var input : String = ""
    @State private var offset : CGFloat = 0
    var body: some View {
        
        PF_OffsetScrollView(offset: $offset) {
            VStack(spacing:24){
                TextField("搜索电影、文档", text: $input)
                    .frame( height: GoldenH, alignment: .leading)
                    .padding(.leading,36)
                    .background(Color.Card)
                    .overlay(ICON(sysname: "magnifyingglass",fcolor: .fc1).MoveTo(.centerLeading)
                                .padding(.leading,12)
                    )
                    .cornerRadius(4)
                    .padding(.all,12)
                
              
                searchType
                
                hostSearchList
               
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .PF_Navitop(style: offset < -10 ? .large : .none) {
            BlurView()
        } TopCenterView: {
            Text("Laper")
                .mFont(style: .LargeTitle_22_B,color: .fc1)
        }
      
            
    }
    
    var hostSearchList : some View {
        LazyVStack{
            Text("热门搜索")
                .mFont(style: .Title_17_B,color: .fc1)
                .PF_Leading()
                .padding(.leading,12)
            let w = (SW - 48)/3
            let columns =
            Array(repeating:GridItem(.adaptive(minimum: w, maximum: w), spacing: 12), count: 3)
            
            LazyVGrid(columns:columns,spacing:12,content: {
                ///1...9
                ForEach(1 ..< 30) { index in
                    filmBanner("\(index)")
                }
            })
        }
    }
    var searchType : some View {
        
        VStack{
            Text("搜索指定内容")
                .mFont(style: .Title_17_B,color: .fc1)
                .PF_Leading()
                .padding(.leading,12)
            HStack{
                let f = ( SW - 48)/3
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .foregroundColor(.Card)
                    .frame(width: f, height: f)
                    .overlay(VStack{
                        ICON(sysname: "film.fill",fcolor: .fc2,size: 24)
                        Text("电影")
                            .mFont(style: .Body_15_R,color: .fc1)
                    })
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .foregroundColor(.Card)
                            .frame(width: f, height: f)
                            .overlay(VStack{
                                ICON(sysname: "doc.text.fill", fcolor :.fc2,size: 24)
                                Text("拉片文档")
                                    .mFont(style: .Body_15_R,color: .fc1)
                            })
                           
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .foregroundColor(.Card)
                                    .frame(width: f, height: f)
                                    .overlay(VStack{
                                        ICON(sysname: "person.fill",fcolor:.fc2,size: 24)
                                        Text("人物")
                                            .mFont(style: .Body_15_R,color: .fc1)
                                    })
            }
        }
      
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_iPhone(uistate: .init(.Search))
    }
}
