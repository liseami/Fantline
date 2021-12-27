//
//  UIstate.swift
//  Fantline
//
//  Created by Liseami on 2021/12/14.
//

import SwiftUI

class UIState : ObservableObject{
    
    static let shared = UIState()
    
    
    init(_ appIndex : appPageTag? = nil) {
        self.appIndex = appIndex ?? .Search
    }
    
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
    
    @Published var appIndex : appPageTag = .Search
    @Published var showLaperView : Bool = false
    @Published var showLoginView  :Bool = false
    @Published var showfilmDetailView : Bool = false
    @Published var showSettingView : Bool = false
    
    
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
}
