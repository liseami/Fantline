//
//  FantlineApp.swift
//  Fantline
//
//  Created by Liseami on 2021/11/25.
//

import SwiftUI

@main
struct FantlineApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    //监控场景阶段
    @Environment(\.scenePhase) var scenePhase
    //一个属性来存储持久化控制器
    let persistenceController = PersistenceController.shared
    let userDefaults = UserDefaults.standard

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
