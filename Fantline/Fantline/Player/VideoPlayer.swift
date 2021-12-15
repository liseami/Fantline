//
//  VideoPlayer.swift
//  Fantline
//
//  Created by Liseami on 2021/12/15.
//

import SwiftUI
import AVKit

class PlayerViewModel : ObservableObject{
    var fileName : String
    init(fileName : String){
        self.fileName = fileName
    }
    var player = AVPlayer()
}


struct VideoPlayerView: View {
    
    @StateObject private var model = PlayerViewModel(fileName: "SampleVideo_720x480_20mb")
    
    
    var body: some View {
        
        
        VStack{
            VideoPlayer(player: model.player) {
                Text("234234")
            }
            .frame(width: SW , height: SW / 16 * 9)
            
            Spacer()
        }
        
        
        
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
