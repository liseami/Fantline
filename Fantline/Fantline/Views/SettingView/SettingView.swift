//
//  SettingView.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/27.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var uistate = UIState.shared
    @State private var offset : CGFloat = 0
    @State private var showLunchAnimation : Bool = false
    var body: some View {
        
     
            NavigationView {
                ZStack{
                    Color.BackGround.ignoresSafeArea()
                    
                    PF_OffsetScrollView(offset: $offset) {
                        VStack(spacing:32){
                        
                            Group{
                                SettingViewLabel("致电影从业用户的一封信") {
                                    
                                }
                                
                                SettingViewLabel("邀请朋友关注Laper") {
                                    
                                }
                               
                                SettingViewLabel("通知") {
                                    
                                }
                                
                                SettingViewLabel("隐私") {
                                    
                                }
                                
                                Spacer().frame( height: 0)
                                
                                SettingViewLabel("关于Laper") {
                                    
                                }
                                
                                SettingViewLabel("AppStore评分") {
                                    
                                }

                            }
                       
                            
                            
                            SettingViewLabel("颜色模式",style: .none) {
                                
                            }
                            SettingViewLabel("启动动画",style: .none) {
                                
                            }
                            .overlay(Toggle(isOn: $showLunchAnimation, label: {
                                
                            }).MoveTo(.centerTrailing))
                            
                            Divider().background(Color.fc1.opacity(0.3))
                            
                            Text("退出登录")
                                .mFont(style: .Title_17_B,color: .Danger)
                                .PF_Leading()
                            
                            Spacer()
                        }
                        .padding(.all,20)
                    }
              
                    
                    
                    versionInfo.MoveTo(.bottomCenter)
                }
                .navigationBarTitleDisplayMode(.inline)
                .PF_Navitop(style: offset < -10 ? .large : .none, backgroundView: {
                    BlurView()
                }, TopCenterView: {
                    Text("设定")
                        .mFont(style: .Title_17_B,color: .fc1)
                })
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        CloseBtn(){
                    uistate.showSettingView = false}
                    }
                }
              
            }
        
       
        
    }
    
    @ViewBuilder
    var versionInfo : some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer().frame(width: 0, height: 16)
            Text(" V " + AppVersion!)
                .mFont(style: .Title_19_B,color: .fc2.opacity(0.6))
            Text("Whisper Shanghai ©️ \(Date().toString(dateFormat: "YYYY"))")
                .mFont(style: .Body_15_R,color: .fc2.opacity(0.4))
        }
    }
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}


struct SettingViewLabel : View {
    let title : String
    let action : ()->()
    let style : SettingViewLabelStyle
    enum SettingViewLabelStyle {
        case navi,toggle,none
    }
    
    init(_ title : String,style : SettingViewLabelStyle = .navi,action :@escaping () -> ()){
        self.title = title
        self.action = action
        self.style = style
    }
    
    var body: some View{
        
        Button {
            action()
        } label: {
            HStack{
                Text(title)
                    .mFont(style: .Title_17_B,color: .fc1)
                Spacer()
                ICON(sysname: "chevron.right",fcolor: .fc1)
                    .ifshow(style == .navi)
            }
        }
    }
}
