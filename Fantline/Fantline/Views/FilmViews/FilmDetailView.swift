//
//  filmDetailView.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/26.
//

import SwiftUI

struct FilmDetailView: View {
    @State private var offset : CGFloat = 0
    @ObservedObject var uistate = UIState.shared
    
    var body: some View {
        let film = uistate.targetFilm
        PF_OffsetScrollView(offset: $offset) {
            VStack{
                HStack{
                    filmBanner(url: film.image)
                    VStack(alignment: .leading, spacing: 12){
                        Text(film.title)
                        Text(film.fullTitle)
                        Text(film.year)
                        Text(film.crew)
                        Text(film.imDbRating)
                    }
                    .mFont(style: .Title_17_B,color: .fc1)
                    
                    
                    Spacer()
                    
                    Text(film.imDbRating)
                        .mFont(style: .large32_B,color: .fc1)
                }
                
            }
            .padding(.all,24)
            
        }
        
    }
}

struct filmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.BackGround.ignoresSafeArea()
            FilmDetailView()
        }
        
    }
}
