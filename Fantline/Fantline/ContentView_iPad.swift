//
//  ContentView_iPad.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/25.
//

import SwiftUI
import FantasyUI

struct ContentView_iPad: View {
    var body: some View {
        NavigationView {
            HStack(spacing:0){
                ContentView_iPhone()
                    .frame(width:  (  UIDevice.current.orientation == .portraitUpsideDown ? SW : SH) * 0.3)
                LibrayView()
                    .frame(width:(UIDevice.current.orientation == .portraitUpsideDown ? SW : SH) * 0.7)
            }
        }
        .navigationViewStyle(.stack)
    }
    
    
}

struct ContentView_iPad_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ContentView_iPad()
                .previewInterfaceOrientation(.landscapeRight)
        } else {
            // Fallback on earlier versions
        }
    }
}
