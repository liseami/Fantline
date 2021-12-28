//
//  FindView.swift
//  Fantline
//
//  Created by Liseami on 2021/12/14.
//

import SwiftUI

struct FindView: View {
    
    @State private var offset : CGFloat = 0
    @ObservedObject var vm = FindViewModule.shared
    
    var body: some View {
        
        
        ZStack{
           
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.BackGround]), startPoint: .topLeading, endPoint: .bottom)
                .frame( height: SH * 0.3)
                .MoveTo(.topCenter)
                .ignoresSafeArea()
//            
            PF_OffsetScrollView(offset: $offset) {
                
                LazyVStack(alignment: .center, spacing: 18, pinnedViews: .sectionFooters){
                    
                    laperDocList
                    
                    if vm.IMDBtop250List.isEmpty{
                        ProgressView()
                    }else{
                        filmList(title: "WisperTop250",list: vm.IMDBtop250List)
                    }
                    
                    
                    filmList(title: "影史经典",list: nil)
                    
                    filmList(title: "Laper名人堂导演", list: nil)
                    
                    filmList(title: "Laper名人堂演员",list: nil)
                }
                .padding(.top,32)
            }
            
         
            
        }
        .onAppear(perform: {
            guard vm.IMDBtop250List.isEmpty else {return}
            vm.getIMDBtop250List()
        })
        .PF_Navitop(style: offset < -10 ? .large : .none) {
            BlurView()
        } TopCenterView: {
            Text("Laper")
                .mFont(style: .LargeTitle_22_B,color: .fc1)
        }
      


      
           
    }
    
    var laperDocList : some View{
        VStack(spacing:12){
            Text("拉片推荐")
                .mFont(style: .Title_17_B,color: .fc1)
                .PF_Leading()
                .padding(.leading,12)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:6){
                    Spacer().frame(width: 6)
                    LaperDocCard(title: "非典型回环叙事结构与象征美学", subline: "编辑推荐拉片文档")
                    LaperDocCard(title: "现代主义与英雄之旅", subline: "编辑推荐拉片文档")
                    Spacer().frame(width: 6)
                }
            }
            .padding(.bottom,12)
        }
      
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_iPhone(uistate: .init(.Find))
    }
}






