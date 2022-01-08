//
//  UIstate.swift
//  Fantline
//
//  Created by Liseami on 2021/12/14.
//

import SwiftUI

class UIState : ObservableObject{
    
    static let shared = UIState()
    
    let userdefult = UserDefaults.standard
    init(_ appIndex : appPageTag? = nil) {
        self.appIndex = appIndex ?? .Find
    }
    @Published var appIndex : appPageTag = .Find
    
    //MARK: 钟摆
    var timer_02 = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    var timer_01 = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    
    
    var appIndexs : [appPageTag] = [.Find,.Libray,.Search]
    enum appPageTag {
        case Find
        case Libray
        case Search
        
        var iconname : String{
            switch self {
            case .Find:
                return "location.fill"
            case .Libray:
                return "list.bullet.below.rectangle"
            case .Search:
                return "magnifyingglass"
            }
        }
        
    }
    
  
    @Published var showLaperView : Bool = false
    @Published var showLoginView  :Bool = false
    @Published var showfilmDetailView : Bool = false
    @Published var showSettingView : Bool = false
    
    @Published var showAddMenu : Bool = false
    
    @Published var TabbarProgress : Double = 0.618
    @Published var showProfileView : Bool = false
    @Published var showLibraySubView : Bool = false
    enum LibraySubviewName {
        case FilmList
        case LaperDoc
        case MuseDoc
        case ShotPlan
    }
    @Published var showLibraySubViewEnum : LibraySubviewName = .FilmList
    func openLibraySubView(_ pageCase:LibraySubviewName){
        self.showLibraySubViewEnum = pageCase
        self.showLibraySubView = true
    }
    @Published var showPlayerView : Bool = false
    
    @Published var targetFilm : Top250DataDetail = Top250DataDetail(id: "1", rank: "1", title: "碧海蓝天", fullTitle: "《碧海蓝天》", year: "1993",
                                                                    image:"https://m.media-amazon.com/images/M/MV5BMGM4M2Q5N2MtNThkZS00NTc1LTk1NTItNWEyZjJjNDRmNDk5XkEyXkFqcGdeQXVyMjA0MDQ0Mjc@._V1_UX128_CR0,3,128,176_AL_.jpg",
                                                                    crew: "Frank Darabont (dir.), Tim Robbins, Morgan Freeman",
                                                                    imDbRating: "9.2",
                                                                    imDbRatingCount: "2512082")
    
    enum FilmListStyle {
        case block ,list
    }
    func FilmListModuleChange(){
        switch self.FilmListModule{
        case .block:
            FilmListModule = .list
        case .list:
            FilmListModule = .block
        }
    }
    var FilmListModule : FilmListStyle {
        get {
            let str =  userdefult.string(forKey: "FilmListModule")
            if str == "block" {return .block}
            if str == "list" {return .list}
            else{
                return .block
            }
        }
        set{
            objectWillChange.send()
            if newValue == .block {userdefult.set("block", forKey: "FilmListModule")}
            if newValue == .list {userdefult.set("list", forKey: "FilmListModule")}
        }
    }
    
    @Published var filmDetailColor : Color = .fc2
    
}
