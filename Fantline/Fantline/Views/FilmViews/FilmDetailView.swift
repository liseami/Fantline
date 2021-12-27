//
//  filmDetailView.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/26.
//

import SwiftUI

struct FilmDetailView: View {
    @State private var offset : CGFloat = 0
    var body: some View {
        PF_OffsetScrollView(offset: $offset) {
            VStack{
                HStack{
                    filmBanner("28")
                    VStack(alignment: .leading, spacing: 12){
                        Text("Les Miserables")
                            .mFont(style: .Title_17_B,color: .fc1)
                        Text("Les Miserables")
                    }
                    Spacer()
                }
            }
            .padding(.all,12)
            
        }
        
    }
}

struct filmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FilmDetailView()
    }
}
