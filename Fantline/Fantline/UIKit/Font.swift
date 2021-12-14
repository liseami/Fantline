//
//  Font.swift
//  Font
//
//  Created by cwcw on 2021/8/2.
//

import SwiftUI


public struct MFont : ViewModifier{
    
    enum  Style {
       
        
        
        case large32_R,large32_B
        case largeTitle_24_B,LargeTitle_22_B
        case Title_19_B,Title_17_B,Title_16_B
        case Body_15_B,Body_13_B,Body_12_B
        case Caption_10_B,Caption_9_B
        
        case largeTitle_24_R,LargeTitle_22_R
        case Title_19_R,Title_17_R,Title_16_R
        case Body_15_R,Body_13_R,Body_12_R
        case Caption_10_R,Caption_9_R
        
    }
    
    var style : Style
    
    public func body(content: Content) -> some View {
        
        switch style {
            
        case .large32_R :
            return content
                .font(.custom("Montserrat-Light", size: 32))
        case .large32_B :
            return content
                .font(.custom("Montserrat-SemiBold", size: 32))
            
        case .largeTitle_24_B:
            
            return content
                .font(.custom("Montserrat-SemiBold", size: 24))
                
        case .LargeTitle_22_B:
            return content
                .font(.custom("Montserrat-SemiBold", size: 22))
        case .Title_19_B:
            return content
                .font(.custom("Montserrat-SemiBold", size: 19))
        case .Title_17_B:
            return content
                .font(.custom("Montserrat-SemiBold", size: 17))
        case .Title_16_B:
            return content
                .font(.custom("Montserrat-SemiBold", size: 16))
        case .Body_15_B:
            return content
                .font(.custom("Montserrat-SemiBold", size: 15))
        case .Body_13_B:
            return content
                .font(.custom("Montserrat-SemiBold", size: 13))
        case .Body_12_B:
            return content
                .font(.custom("Montserrat-SemiBold", size: 12))
        case .Caption_10_B:
            return content
                .font(.custom("Montserrat-SemiBold", size: 10))
        case .Caption_9_B:
            return content
                .font(.custom("Montserrat-SemiBold", size: 9))
            
        case .largeTitle_24_R:
            return content
                .font(.custom("Montserrat-Light", size: 24))
        case .LargeTitle_22_R:
            return content
                .font(.custom("Montserrat-Light", size: 22))
        case .Title_19_R:
            return content
                .font(.custom("Montserrat-Light", size: 19))
        case .Title_17_R:
            return content
                .font(.custom("Montserrat-Light", size: 17))
        case .Title_16_R:
            return content
                .font(.custom("Montserrat-Light", size: 16))
        case .Body_15_R:
            return content
                .font(.custom("Montserrat-Light", size: 15))
        case .Body_13_R:
            return content
                .font(.custom("Montserrat-Light", size: 13))
        case .Body_12_R:
            return content
                .font(.custom("Montserrat-Light", size: 12))
        case .Caption_10_R:
            return content
                .font(.custom("Montserrat-Light", size: 10))
        case .Caption_9_R:
            return content
                .font(.custom("Montserrat-Light", size: 9))
        }
    }
}


extension View {
    func mFont(style:MFont.Style) -> some View {
        self.modifier(MFont(style: style))
    }
    func mFont(style:MFont.Style,color:Color) -> some View {
        self.modifier(MFont(style: style))
            .foregroundColor(color)
    }
}
