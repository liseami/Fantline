//
//  FantlineApp.swift
//  Fantline
//
//  Created by Liseami on 2021/11/25.
//

import SwiftUI

@main
struct FantlineApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
