//
//  FirstCompleteLoginView.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/25.
//

import SwiftUI

struct FirstCompleteLoginView: View {
    var body: some View {
        
        ZStack {
            Color.BackGround.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 36){
                Text("准备就绪")
                    .mFont(style: .large32_B,color: .fc1)
                Text("拉片Laper是为“认真对待电影”的人们特别打造的。是记录观影、分析电影、制定拍摄计划的有趣社区。")
                    .mFont(style: .Title_17_R,color: .fc1)
                MainButton(title: "现在开始") {
                    UIState.shared.showLoginView.toggle()
                }
            }
            .padding(.all,32)
        }
        
    }
}

struct FirstCompleteLoginView_Previews: PreviewProvider {
    static var previews: some View {
        FirstCompleteLoginView()
    }
}
