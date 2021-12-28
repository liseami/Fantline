//
//  filmComps.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/26.
//

import SwiftUI


struct filmList : View {
    var title : String
    var list : [Top250DataDetail]?
    
    init(title:String,list:[Top250DataDetail]?){
        self.title = title
        self.list = list
    }
    
    var body: some View{
        VStack(spacing:12){
            Text(title)
                .mFont(style: .Title_17_B,color: .fc1)
                .PF_Leading()
                .padding(.leading,12)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing:6){
                    
                    Spacer().frame(width: 6)
                    if let list = list {
                        ForEach(list,id:\.self.id) { film in
                            filmBanner(url: film.image)
                                .onTapGesture {
                                    UIState.shared.showfilmDetailView = true
                                    UIState.shared.targetFilm = film
                                }
                            }
                    }
                  ForEach(0 ..< 4) { index in
                        filmBanner(url: "")
                    }
                Spacer().frame(width: 12)
                }
                .frame( height: SW * 0.3 * 1.618)
            }
        }
    }
}


struct filmBanner : View {
    var imagename : String?
    var url : String?
    
    public init(imagename: String?){
        self.imagename = imagename
        self.url = nil
    }
    
    public init(url: String?){
        self.url = url
        self.imagename = nil
    }
    
    var body: some View{
        
        
        banner
        
    }
    
    @ViewBuilder
    var banner : some View {
        if let imagename = imagename {
            Image(imagename)
                .resizable()
                .scaledToFill()
                .frame(width: SW * 0.3,height: SW * 0.3 * 1.618)
                .cornerRadius(4)
              
                .contextMenu {
                    Button {
                    } label: {
                        Label {
                            Text("添加至资料库")
                        } icon: {
                            ICON(sysname: "plus.app")
                        }
                    }
                }
        }else{
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string:url!)){ image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: SW * 0.3,height: SW * 0.3 * 1.618)
                        .cornerRadius(4)
                        .contextMenu {
                            Button {
                            } label: {
                                Label {
                                    Text("添加至资料库")
                                } icon: {
                                    ICON(sysname: "plus.app")
                                }
                            }
                        }
                }placeholder: {
                    Color.Card
                        .frame(width: SW * 0.3,height: SW * 0.3 * 1.618)
                        .cornerRadius(4)
                }
                 
            } else {
                // Fallback on earlier versions
            }
        }
       
    }
}

struct filmComps_Previews: PreviewProvider {
    static var previews: some View {
        filmList(title: "Exmple", list: [Top250DataDetail( image: "https://m.media-amazon.com/images/M/MV5BM2RiZDVjYWEtZGNhYy00ZGU0LTgwZjMtZTJmNmMyNGQ5NGYyXkEyXkFqcGdeQXVyNjY1MTg4Mzc@._V1_UX128_CR0,3,128,176_AL_.jpg")])
            .padding()
            .previewLayout(.sizeThatFits)
        filmBanner(url: "https://m.media-amazon.com/images/M/MV5BM2RiZDVjYWEtZGNhYy00ZGU0LTgwZjMtZTJmNmMyNGQ5NGYyXkEyXkFqcGdeQXVyNjY1MTg4Mzc@._V1_UX128_CR0,3,128,176_AL_.jpg")
            .previewLayout(.sizeThatFits)
        VStack{
            filmList(title: "Exmple", list: nil)
            filmList(title: "Exmple", list: nil)
            Spacer()
            filmBanner(imagename: "3")
       
        }
        .padding(.all,12)
    }
}
