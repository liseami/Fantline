//
//  FantlineApp.swift
//  Fantline
//
//  Created by Liseami on 2021/11/25.
//

import SwiftUI
@_exported import FantasyUI

@main
struct FantlineApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    //监控场景阶段
    @Environment(\.scenePhase) var scenePhase
    //一个属性来存储持久化控制器
    let persistenceController = PersistenceController.shared
    let userDefaults = UserDefaults.standard
    @ObservedObject var uistate = UIState.shared

    
    var body: some Scene {
        WindowGroup {
                rootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        
        
    }
    
    func rootView()-> some View{
          switch Device.deviceType {
          case .ipad:
              return AnyView(ContentView_iPad())
          default:
              return AnyView(ContentView_iPhone())
          }
      }
    
  
}

enum Device {
    //MARK:当前设备类型 iphone ipad mac
    enum Devicetype{
        case iphone,ipad,mac
    }
    static var deviceType:Devicetype{
        #if os(macOS)
        return .mac
        #else
        if  UIDevice.current.userInterfaceIdiom == .pad {
           
            return .ipad
        }
        else {
            return .iphone
        }
        #endif
 }
}

extension View {
    @ViewBuilder func ifIs<T>(_ condition: Bool, transform: (Self) -> T) -> some View where T: View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    @ViewBuilder func ifElse<T:View,V:View>( _ condition:Bool,isTransform:(Self) -> T,elseTransform:(Self) -> V) -> some View {
        if condition {
            isTransform(self)
        } else {
            elseTransform(self)
        }
    }
}
