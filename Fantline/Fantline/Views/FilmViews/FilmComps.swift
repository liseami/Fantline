//
//  filmComps.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/26.
//

import SwiftUI

struct filmList : View {
    let title : String
    let startIndex : Int
    init(title:String,startIndex:Int){
        self.title = title
        self.startIndex = startIndex
    }
    var body: some View{
        VStack(spacing:12){
            Text(title)
                .mFont(style: .Title_17_B,color: .fc1)
                .PF_Leading()
                .padding(.leading,12)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing:6){
                    Spacer().frame(width: 6)
                ForEach(startIndex ..< startIndex + 6) { index in
                  
                        filmBanner("\(index)")
                    

                        
                    }
                Spacer().frame(width: 12)
                }
                .frame( height: SW * 0.3 * 1.618)
            }
        }
    }
}


struct filmBanner : View {
    let imagename : String
    init(_ imagename: String){
        self.imagename = imagename
    }
    var body: some View{
        
        
        if #available(iOS 15.0, *) {
            banner
            
                .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: 4, style: .continuous))
        } else {
             banner
        }
        
    }
    
    var banner : some View {
        Image(imagename)
            .resizable()
            .scaledToFill()
            .frame(width: SW * 0.3,height: SW * 0.3 * 1.618)
            .cornerRadius(4)
            .onTapGesture {
                UIState.shared.showfilmDetailView = true
            }
            .contextMenu {
                Button {
                } label: {
                    Label {
                        Text("添加至资料库")
                    } icon: {
                        ICON(sysname: "plus.app")
                    }
                }
            }
    }
}

struct filmComps_Previews: PreviewProvider {
    static var previews: some View {
        filmList(title: "Exmple", startIndex: 1)
            .padding()
            .previewLayout(.sizeThatFits)
        filmBanner("3")
            .previewLayout(.sizeThatFits)
        VStack{
            filmList(title: "Exmple", startIndex: 1)
            filmList(title: "Exmple", startIndex: 1)
            Spacer()
            filmBanner("3")
       
        }
        .padding(.all,12)
    }
}
