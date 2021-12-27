//
//  CommunIcon.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/25.
//


import SwiftUI

struct CloseBtn : View {
    let action : ()->()
    
    var body: some View{
        ICON(sysname:"xmark",fcolor: .fc1){
            action()
        }
    }
}
