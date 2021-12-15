//
//  LibrayView.swift
//  Fantline
//
//  Created by Liseami on 2021/12/14.
//

import SwiftUI

struct LibrayView: View {
    @State private var offset : CGFloat = 0
    var body: some View {
        
        
        PF_OffsetScrollView(offset: $offset) {
            VStack(spacing:24){
                VStack(spacing:12){
                    HStack(spacing:12){
                        OfficalFloderItem(text: "全部拉片", iconname: "Archive"){}
                        OfficalFloderItem(text: "星标", iconname: "Star"){}
                    }
                    HStack(spacing:12){
                        OfficalFloderItem(text: "影片文件", iconname: "Compiling"){}
                        OfficalFloderItem(text: "最近删除", iconname: "Trash"){}
                    }
                }
                Text("文件夹")
                    .mFont(style: .Title_17_B,color: .fc1)
                    .PF_Leading()
                VStack(spacing:12){
                    ForEach(0..<12) { index in
                        FloderItem(randomString(6),nums: "\(Int.random(in: 0...1209))"){}
                    }
                }
            }
            .padding(.all,24)
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                ICON(sysname: "folder.badge.plus",fcolor: .fc1,size: 14)
                    .padding(.trailing,12)
            }
        })
        .navigationTitle(Text("拉片文档"))
        .navigationBarTitleDisplayMode(.inline)
        .PF_Navitop(style: offset < -5 ? .large : .none) {BlurView()} TopCenterView: {}

        
        
        
       
    }
}

struct LibrayView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(uistate:UIState(.Libray))
     
    }
}


