//
//  FindViewModule.swift
//  Fantline
//
//  Created by 赵翔宇 on 2021/12/27.
//

import FantasyUI

//mods

struct Top250DataDetail : Convertible,Decodable{
    
    var    id:  String = ""
    var    rank:  String = ""
    var    title:  String = ""
    var    fullTitle:  String = ""
    var    year:  String = ""
    var    image:  String = ""
    var    crew:  String = ""
    var    imDbRating:  String = ""
    var    imDbRatingCount:  String = ""
}

struct Top250Data : Convertible,Decodable{
    var items : [Top250DataDetail] = []
    var errorMessage : String = ""
}

struct NewMovieData : Convertible,Decodable{
    var items : [NewMovieDataDetail] = []
    var errorMessage : String = ""
}

struct NewMovieDataDetail : Convertible,Decodable{
    var  id : String = ""
    var  title : String = ""
    var  fullTitle : String = ""
    var  year : String = ""
    var  releaseState : String = ""
    var  image : String = ""
    var  runtimeMins : String = ""
    var  runtimeStr : String = ""
    var  plot : String = ""
    var  contentRating : String = ""
    var  imDbRating : String = ""
    var  imDbRatingCount : String = ""
    var  metacriticRating : String = ""
    var  genres : String = ""
    var  directors : String = ""
    var  stars : String = ""
}


//Api
enum IMDB_API : ApiType {
    case IMDBtop250List
    case ComingSoonList
    
    var path: String {
        switch self {
        case .IMDBtop250List:
            return "en/API/Top250Movies/k_cv8oq4xk"
        case .ComingSoonList:
            return "en/API/ComingSoon/k_cv8oq4xk"
        }
        
    }
    
    var method: HTTPRequestMethod {
        .get
    }
    
    var parameters: [String : Any]? {
        nil
    }
    
}
 

class FindViewModule : ObservableObject{
    static let shared = FindViewModule()
    @Published var IMDBtop250List : [Top250DataDetail] = []
    @Published var IMDBHost: [Top250DataDetail] = []
    @Published var IMDBComingsoonList : [NewMovieDataDetail] = []
    
    func getIMDBtop250List(){
        let target = IMDB_API.IMDBtop250List
        
        Networking.request(target) { result in
            if let json = result.rawReponse?.data{
                let decoder = JSONDecoder()
                let product = try! decoder.decode(Top250Data.self, from: json)
                print(product.items.count)
                self.IMDBtop250List = product.items
            }
        }
    }
    
    func getComingSoonList(){
        let target = IMDB_API.ComingSoonList
        Networking.request(target) { result in
            if let json = result.rawReponse?.data{
                let data = try! JSONDecoder().decode(NewMovieData.self, from: json)
                self.IMDBComingsoonList = data.items
            }
           
        }
    }
    
}
