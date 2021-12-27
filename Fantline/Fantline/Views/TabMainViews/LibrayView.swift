//
//  LibrayView.swift
//  Fantline
//
//  Created by Liseami on 2021/12/14.
//

import SwiftUI

struct LibrayView: View {
    @State private var offset : CGFloat = 0
    
    @State private var showFilmList : Bool = false
    @State private var showLaperDoc : Bool = false
    @State private var showIdeaDoc : Bool = false
    @State private var showShotPlan : Bool = false
    
    var body: some View {
        
        
        PF_OffsetScrollView(offset: $offset) {
            
                VStack(spacing:24){
                        OfficalFloderItem(text: "个人片单", iconname: "Align-justify"){
                            showFilmList.toggle()
                        }
                        OfficalFloderItem(text: "拉片文档", iconname: "Clipboard-list"){
                            showLaperDoc.toggle()
                        }
                        OfficalFloderItem(text: "灵感笔记", iconname: "Star",isPro: true){
                            showIdeaDoc.toggle()
                        }
                        OfficalFloderItem(text: "拍摄计划", iconname: "Done",isPro: true){
                            showShotPlan.toggle()
                        }
            }
            .padding(.all,20)
            
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
        .PF_Navilink(isPresented: $showFilmList) {
            FilmListView()
        }
      
        .PF_Navilink(isPresented: $showLaperDoc) {
            LaperDocView()
        }
        .PF_Navilink(isPresented: $showIdeaDoc) {
            MuseDocView()
        }
       
        .PF_Navilink(isPresented: $showShotPlan) {
            ShotPlanView()
        }
       
      
        
        
        
        
        
    }
}

struct LibrayView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_iPhone(uistate:UIState(.Libray))
        
    }
}


