//
//  LaperView.swift
//  Fantline
//
//  Created by Liseami on 2021/12/14.
//

import SwiftUI
import AVKit



struct LaperView: View {
    
    
    @ObservedObject var uistate = UIState.share
    @State private var showStep : Int = 0
    @State private var showBlackBackground : Bool = false
    var body: some View {
        ZStack{
            
            ZStack{
                Color.fc1
                    .ignoresSafeArea()
                    .ifshow(showStep > 2, animation: .spring(), transition: .opacity)
                
                PieChart(1)
                    .scaledToFit()
                    .blur(radius: 119)
                    .animation(.spring(), value: showBlackBackground)
                    .offset( y: showStep > 5 ? -SW - 50  : -SH * 2)
            }

            
            VStack{
                
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5]), antialiased: false)
                    .foregroundColor(.back1)
                    .frame( height:  (SW - 48) * 0.618)
                    .overlay(
                        VStack{
                            ICON(sysname: "plus",fcolor: .back1,size: 32)
                            Text("添加影片开始拉片")
                                .mFont(style: .Body_15_R,color: .back1)
                        }
                 
                    )
                
                Spacer()
            }
            .padding(.all,24)
           
        }
        .PF_Timer(timer: uistate.timer_01, showStep: $showStep, limit: 6)
      
        
    }
}

struct LaperView_Previews: PreviewProvider {
    static var previews: some View {
        LaperView()
    }
}
