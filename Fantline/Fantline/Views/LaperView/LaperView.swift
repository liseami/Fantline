//
//  LaperView.swift
//  Fantline
//
//  Created by Liseami on 2021/12/14.
//

import SwiftUI
import AVKit



struct LaperView: View {
    
    
    @ObservedObject var uistate = UIState.shared
    @State private var showStep : Int = 0
    @State private var showBlackBackground : Bool = false
    
    @State private var addFilm : Bool = false
    @State private var offset : CGFloat = 0
    var body: some View {
        
            ZStack{
                back
                
                
                PF_OffsetScrollView(offset: $offset) {
                    VStack(alignment: .leading, spacing: 24){
                        
                        Text("创作拉片")
                            .mFont(style: .LargeTitle_22_B,color: .fc1)
                            .PF_Leading()
                        
                        Button {
                            addFilm.toggle()
                        } label: {
                            HStack{
                                ICON(sysname: "plus",fcolor: .fc1, size: 24)
                                    .frame(width: GoldenH * 1.618, height: GoldenH)
                                    .background(Color.Card)
                                    Text("添加影片")
                                        .mFont(style: .Body_15_B,color: .fc1)
                                Spacer()
                            }
                        }

                      
                        
                        Button {
                            uistate.showPlayerView.toggle()
                        } label: {
                            HStack{
                                Image("32")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: GoldenH * 1.618, height: GoldenH)
                                    .clipped()
                                    .background(Color.Card)
                                    Text("足不出户编年史")
                                        .mFont(style: .Body_15_B,color: .fc1)
                            }
                        }

                        
                        Spacer()
                    
                        }
                    .padding(.all,24)
                }
        
            
            }
            .PF_Navilink(isPresented: $uistate.showPlayerView, content: {
            PlayerView()
            })
            .navigationBarTitleDisplayMode(.inline)
        .PF_Timer(timer: uistate.timer_01, showStep: $showStep, limit: 6)
        .PF_Sheet(isPresented: $addFilm, backColor: Color.clear) {
            VStack(spacing:24){
                SheetCardLabel(iconname: "Icon=floder", title: "从文件导入", subline: "从本地文件导入电影文件"){}
        
                SheetCardLabel(iconname: "Icon=photos", title: "从相册导入", subline: "从本地文件导入电影文件"){}
        
                SheetCardLabel(iconname: "Apple Music Icon", title: "从电脑同步至手机", subline: "从本地文件导入电影文件"){}
            }
            .CardSheet()
        }
        
    }
    
    var addfilm : some View {
        Button {
            self.addFilm.toggle()
        } label: {
            Color.Card
                  .clipShape(RoundedRectangle(cornerRadius: 4))
                  .frame( height:  (SW - 48) * 0.618)
                  .overlay(
                      VStack{
                          ICON(sysname: "plus",fcolor: .back1,size: 32)
                          Text("添加影片开始拉片")
                              .mFont(style: .Body_15_R,color: .back1)
                      }
                  )
                  .overlay(  RoundedRectangle(cornerRadius: 4, style: .continuous)
                              .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5]), antialiased: false)
                              .foregroundColor(.fc1))
             
          }
         
    }
    var back : some View{
        ZStack{
            Color.BackGround
                .ignoresSafeArea()
                .ifshow(showStep > 2, animation: .spring(), transition: .opacity)
            PieChart(1)
                .scaledToFit()
                .blur(radius: 119)
                .animation(.spring(), value: showBlackBackground)
                .offset( y: showStep > 5 ? -SW * 1.4  : -SH * 2)
        }
    }
}

struct LaperView_Previews: PreviewProvider {
    static var previews: some View {
        LaperView()
    }
}



struct sheetCard : ViewModifier {
    func body(content: Content) -> some View {
       content
            .padding(.all,24)
            .background(Color.Card)
            .clipShape(RoundedRectangle(cornerRadius: 12,style: .continuous))
            .padding(.all,12)
            .padding(.bottom,24)
            
    }
}
extension View{
    func CardSheet()->some View {
        return self.modifier(sheetCard())
    }
}

struct SheetCardLabel : View {
    let iconname : String
    let title : String
    let subline : String
    let action : ()->()
    init(iconname : String,title:String,subline:String,action : @escaping ()->()){
        self.iconname = iconname
        self.title = title
        self.subline = subline
        self.action = action
    }
    var body: some View
    {
        Button {
            action()
        } label: {
            HStack{
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .frame(width: GoldenH, height: GoldenH)
                    .overlay(Image(iconname).resizable().scaledToFill())
                
                VStack(alignment: .leading, spacing: 2){
                    Text(title)
                        .mFont(style: .Body_15_B,color: .fc1)
                        .PF_Leading()
                    Text(subline)
                        .mFont(style: .Body_13_R,color: .fc3)
                }
                Spacer()
            }
        }
    }
}
