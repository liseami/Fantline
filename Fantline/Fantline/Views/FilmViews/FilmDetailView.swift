//
//  filmDetailView.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/26.
//

import SwiftUI
import FantasyUI

struct FilmDetailView: View {
    @State private var offset : CGFloat = 0
    @ObservedObject var uistate = UIState.shared
    
    
    
    var body: some View {
       
        
        ZStack {
            
            getcolor
         
        
            Color.BackGround.ignoresSafeArea()
            filmBanner(url: uistate.targetFilm.image,width: SW)
                .MoveTo(.topCenter)
                .ignoresSafeArea()
                .opacity(0.26)
            VStack(spacing:0){
                LinearGradient(gradient: Gradient(colors: [Color.BackGround, uistate.filmDetailColor]), startPoint: .bottom, endPoint: .top)
                    .frame(height: SH * 0.618)
                Color.BackGround.ignoresSafeArea()
            }
            .ignoresSafeArea()
          

            
            PF_OffsetScrollView(offset: $offset) {
                VStack(spacing:36){
                    
                    filmBanner(url: uistate.targetFilm.image,width: SW / 2.8)
                    
                    
                    filmInfo
                    
                    
              
                    web3Card
                       
                    
                    VStack(spacing:24){
                        HStack(alignment: .top){
                            VStack(spacing:4){
                                Text("拉片文档")
                                    .mFont(style: .Body_15_B,color: .fc1)
                                    .PF_Leading()
                            }
                            Spacer()
                            ICON(sysname: "chevron.down",fcolor: .fc1)
                        }
                        HStack{
                            Image("system-folder--apple-menu-items--recent-documents")
                                .resizable()
                                .frame(width: 36, height: 36)
                            VStack(alignment: .leading, spacing: 4){
                                Text("生死回环和英雄之旅")
                                    .mFont(style: .Body_15_B,color: .fc1)
                                Text("by 小孩游神")
                                    .mFont(style: .Body_13_R,color: .fc2)
                                    .PF_Leading()
                            }
                        }
                  
                    }
                    .padding(.horizontal,12)
                 
                    HStack{
                        Image("system-folder--apple-menu-items--recent-documents")
                            .resizable()
                            .frame(width: 36, height: 36)
                        VStack(alignment: .leading, spacing: 4){
                            Text("我对电影的一点见解")
                                .mFont(style: .Body_15_B,color: .fc1)
                            Text("by 碍于面子")
                                .mFont(style: .Body_13_R,color: .fc2)
                                .PF_Leading()
                        }
                    
              
                }
                .padding(.horizontal,12)
                
                
                   

                    
                    Spacer()
                }
                .padding(.all,12)
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ICON(sysname: "ellipsis",fcolor: .fc1)
            }
        }
    
        
    }
    
    @ViewBuilder
    var filmInfo : some View {
        let film = uistate.targetFilm
        
        VStack(alignment: .center, spacing: 12){
            Text(film.title)
                .mFont(style: .largeTitle_24_B,color: .fc1)
            
            HStack{
                Text(film.crew)
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                    .mFont(style: .Body_15_B,color: .fc2)
                ICON(sysname: "chevron.right",fcolor: .fc2,size: 16)
            }
            HStack(spacing:12){
                Text(film.year)
                    .foregroundColor(.fc2)
                
                HStack(spacing:4){
                    ICON(name: "imdb",fcolor: .yellow,size: 14)
                    Text("8.9")
                }
                    .textTag(color: .yellow)
                
                HStack(spacing:4){
                    ICON(name: "potatoicon",fcolor: .red,size: 14)
                    Text("90%")
                }
                    .textTag(color: .red)
                
                HStack(spacing:4){
                    ICON(name: "doubanicon",fcolor: .green,size: 14)
                    Text(film.imDbRating)
                }
                    .textTag(color: .green)
                
            }
            .mFont(style: .Body_15_B)
        }
    }
    
    @ViewBuilder
    var web3Card : some View {
        VStack(spacing:0){
            HStack(alignment: .top){
                VStack(spacing:4){
                    Text("最近内容贡献提名")
                        .mFont(style: .Body_15_B,color: .fc1)
                        .PF_Leading()
                        Text("基于暗房Web3.0FNYDAO宣言")
                            .mFont(style: .Body_13_R,color: .fc1)
                            .PF_Leading()
                    
                }
                Spacer()
                ICON(name: "Logo",fcolor: .fc1)
            }
        
                .padding(.all,18)
                .padding(.bottom,-9)
                .background(uistate.filmDetailColor)
            
                HStack{
                    ForEach(0..<4) { index in
                        Spacer().ifshow(index != 0)
                        Image("\(Int.random(in: 1...12))")
                            .resizable()
                            .frame(width:68, height: 68)
                  
                            .clipShape( Circle())
                        Spacer().ifshow(index != 3)
                    }
                }
                .padding(.horizontal,12)
                .padding(.bottom,12)
                .padding(.top,9)
                    .background(ZStack{
                   uistate.filmDetailColor
                        Color.black.opacity(0.1)
                    })
        }
                .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
    }
    
    @ViewBuilder
    var getcolor : some View {
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string:uistate.targetFilm.image)){ image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: SW,height: SW * 1.618)
                        .cornerRadius(4)
                        .onAppear {
                            let uiimage = image.asUIImage()
                            getDominantColorsByUIImage(uiimage) { color  in
                                DispatchQueue.main.async {
                                    madasoft()
                                    uistate.filmDetailColor = color
                                }
                            }
                        }
                }placeholder: {
                    Color.Card
                        .frame(width: SW,height: SW * 1.618)
                        .cornerRadius(4)
                        .overlay(ProgressView())
                }
                 
            } else {
                // Fallback on earlier versions
            }
        
       
    }
}

struct filmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.BackGround.ignoresSafeArea()
            NavigationView {
                FilmDetailView()
            }
           
        }
        
    }
}

struct textTagModifier : ViewModifier{
    var color : Color
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .padding(.horizontal,6)
            .padding(.vertical,3)
            .background(color.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
    }
}

extension View{
    func textTag(color : Color) -> some View{
        self.modifier(textTagModifier(color: color))
    }
}

extension View {
// This function changes our View to UIView, then calls another function
// to convert the newly-made UIView to a UIImage.
    public func asUIImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        
        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
        
        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        
// here is the call to the function that converts UIView to UIImage: `.asUIImage()`
        let image = controller.view.asUIImage()
        controller.view.removeFromSuperview()
        return image
    }
}

extension UIView {
// This is the function to convert UIView to UIImage
    public func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
