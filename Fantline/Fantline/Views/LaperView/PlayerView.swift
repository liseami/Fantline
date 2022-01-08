//
//  PlayerView.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/29.
//

import SwiftUI
import AVKit


struct PlayerView: View {
    
    

    @StateObject var player : FilmPlayer = FilmPlayer()
    @State private var offset : CGFloat = 0
    var body: some View {
        ZStack{
            Color.BackGround.ignoresSafeArea()
            VStack{
                
                VideoPlayer(player: FilmPlayer.player)
                    .frame(height: SW / 16 * 9)


//               Text("\(FilmPlayer.player.currentTime().seconds)")
//                    .mFont(style: .Body_15_B,color: .fc1)
//                    .onTapGesture {
//                        player.play()
//                    }
                Spacer()
                PF_OffsetScrollView(offset: $offset) {
               
                    VStack(alignment: .center, spacing:24){
                        Spacer()
                        VStack(spacing:12){
                            Text("《春天简史》电影拉片文档")
                                .mFont(style: .LargeTitle_22_B,color: .fc2)
                            Text("拉片作者：凉新")
                                .mFont(style: .Body_15_R,color: .fc2)
                            Text(Date().toString(dateFormat: "YYYY-MM-dd"))
                                .mFont(style: .Body_15_R,color: .fc2)
                        }
                       
                        Divider().background(Color.fc3)
                        
                        VStack(spacing:24){
                            HStack(spacing:24){
                                Text("00:00")
                                    .mFont(style: .Body_13_R,color: .fc3)
                                Text("影片开始。")
                                    .mFont(style: .Body_15_R,color: .fc2)
                                Spacer()
                            }
                            
                            ForEach(0 ..< 5) { item in
                                HStack(spacing:24){
                                    Text("23:29")
                                        .mFont(style: .Body_13_R,color: .fc3)
                                    Text(randomString(32))
                                        .mFont(style: .Body_15_R,color: .fc2)
                                    Spacer()
                                }
                            }
                        }
                        .padding(.leading,24)
                    
                 
                }
                    .padding(.all,24)
                }
            }
            
            HStack(spacing:24){
                    ICON(sysname: "plus.rectangle.on.rectangle",fcolor: Color(hex: "8762DB"),size: 20)
                Button {
                } label: {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .frame( height: 44)
                        .foregroundColor(Color.Card)
                        .overlay(Text("Aa").mFont(style: .Body_15_R,color: .fc2).PF_Leading()
                                    .padding(.leading,12))
                }
                ICON(sysname: "square.and.arrow.down",fcolor: Color(hex: "8762DB"),size: 20)
                }
            .padding(.horizontal,32)
            .padding(.vertical,8)
            .background(Color.BackGround.ignoresSafeArea())
            .MoveTo(.bottomCenter)
           
            
            
        }
        
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}


class FilmPlayer : ObservableObject{
    
   static var player = AVPlayer(url: URL(string: "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4")!)
    
    
    
    
    func play(){
        FilmPlayer.player.allowsExternalPlayback = true
        FilmPlayer.player.usesExternalPlaybackWhileExternalScreenIsActive = true
        
        FilmPlayer.player.play()
    }
    
    
  
}
