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

//api

//Api
enum IMDB_API : ApiType {
    case IMDBtop250List
    
    var path: String {
        "en/API/Top250Movies/k_cv8oq4xk"
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
    
    func getIMDBtop250List(){
        let target = IMDB_API.IMDBtop250List

//        Networking.requestObject(target, modeType: Top250Data.self) { r, m  in
//            print(m?.items.count)
//            if m == nil {
//                print("🐯")
//            }
//            print("大熊猫")
//            self.IMDBtop250List = m?.items ?? []
//        }
//
//        Networking.requestObject(target, modeType: Top250Data.self) { r, m  in
//            self.IMDBtop250List = m?.items ?? []
//            print(r.dataJson)
//            print("🐘")
//        }
        
        Networking.request(target) { result in
            if let json = result.rawReponse?.data{
                print( result.json)
                let decoder = JSONDecoder()
                let product = try! decoder.decode(Top250Data.self, from: json)
                print(product.items.count)
                self.IMDBtop250List = product.items
            }
        }
    }
    
}
