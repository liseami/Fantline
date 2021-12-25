//
//  Comps.swift
//  Fantline
//
//  Created by Liseami on 2021/12/14.
//

import SwiftUI
import UIKit



//MARK: 毛玻璃背景Light
//MARK: 毛玻璃效果
struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct BlurView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        if colorScheme == .dark {
            return  VisualEffectView(effect: UIBlurEffect(style : .systemChromeMaterialDark))
        } else  {
            return  VisualEffectView(effect: UIBlurEffect(style : .systemChromeMaterialLight))
        }
    }
}

