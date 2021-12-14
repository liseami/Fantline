//
//  ContentView.swift
//  Fantline
//
//  Created by Liseami on 2021/11/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var appIndex : appPageTag = .Find
    
    enum appPageTag {
        case Find
        case Libray
        case Search
    }
    
    var body: some View {
        
        NavigationView {
            TabView(selection: $appIndex) {
                FindView()
                    .tabItem {
                        ICON(sysname: "location")
                        Text("发现").tag(appPageTag.Find)
                    }
                
                LibrayView()
                    .tabItem {
                        ICON(sysname: "list.and.film")
                        Text("资料库").tag(appPageTag.Libray)
                    }
             
                
                SearchView()
                    .tabItem {
                        ICON(sysname: "magnifyingglass")
                        Text("搜索").tag(appPageTag.Search)
                    }
                
                Text("创作")
                    .tabItem {
                        ICON(sysname: "highlighter")
                        Text("创作").tag(3)
                    }
            }
            .tabViewStyle(.automatic)
            .navigationTitle(Text(getNavigationTitle()))
      
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(.orange)
   
      
    }
    
    func getNavigationTitle() -> String{
        switch appIndex {
        case .Find:
            return "发现"
        case .Libray:
            return "资料库"
        case .Search:
            return "创作"
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
