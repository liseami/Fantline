//
//  LibrayView.swift
//  Fantline
//
//  Created by Liseami on 2021/12/14.
//

import SwiftUI

struct LibrayView: View {
    @State private var offset : CGFloat = 0
    
    @ObservedObject var uistate = UIState.shared
   
    var body: some View {
        
        let tabText = ["片单","拉片文档","灵感匣"]
        PF_OffsetScrollView(offset: $offset) {
            
                VStack(spacing:20){
                    
                    HStack(spacing:24){
                        ForEach(0..<3){index in
                            Text(tabText[index])
                                .padding(.vertical,6)
                                .padding(.horizontal,12)
                                .overlay(Capsule(style: .continuous)
                                            .stroke(lineWidth: 0.5)
                                            .foregroundColor(.fc2))
                        }
                      
                        
                        Spacer()
                    }
                    .mFont(style: .Title_17_B,color: .fc1)

                    
                    HStack{
                        Text("最近添加")
                        Spacer()
                        ICON(name: uistate.FilmListModule == .block
                             ? "Align-justify" : "Layout-4-blocks",fcolor: .fc1){
                            uistate.FilmListModuleChange()
                        }
                    }
                    .mFont(style: .Title_17_B,color: .fc1)
                    
                    
                        let w = uistate.FilmListModule == .list ? (SW - 24) : (SW - 48)/2
                        let columns =
                        Array(repeating:GridItem(.adaptive(minimum: w, maximum: w), spacing: 24), count: uistate.FilmListModule == .list ? 1 : 2)
                        LazyVGrid(columns:columns,spacing:12,content: {
                            ForEach(1..<5){index in
                                FilmListFloder(text: randomString(6),imagename: "\(index * 3)",style: uistate.FilmListModule){
                                    uistate.openLibraySubView(.FilmList)
                                }
                                .id(index)
                            }
                        })
                        .PF_Animation(.spring())
                    
                    
                 
                    
                    
                    HStack{
                        Text("拉片文档")
                        Spacer()
                    }
                    .mFont(style: .Title_17_B,color: .fc1)
                    
                    
                }
                .padding(.all,12)
                .padding(.vertical,12)
            
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                ICON(sysname: "folder.badge.plus",fcolor: .fc1,size: 14)
                    .padding(.trailing,12)
            }
        })
        .navigationBarTitleDisplayMode(.large)
        .PF_Navitop(style: offset < -10 ? .large : .none) {
            BlurView()
        } TopCenterView: {
            Text("Laper")
                .mFont(style: .LargeTitle_22_B,color: .fc1)
        }
        .PF_Navilink(isPresented: $uistate.showLibraySubView) {
            Group{
                switch uistate.showLibraySubViewEnum{
                case .FilmList : FilmListView()
                case .LaperDoc : LaperDocView()
                case .MuseDoc : MuseDocView()
                case .ShotPlan : ShotPlanView()
                }
            }
        }
      
      
        
        
        
        
        
    }
}

struct LibrayView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_iPhone(uistate:UIState(.Libray))
        
    }
}


