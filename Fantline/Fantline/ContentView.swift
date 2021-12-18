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
    @ObservedObject var uistate = UIState.share
    
    var body: some View {
        
      
        NavigationView {
            
            ZStack{
                
                Color.BackGround.ignoresSafeArea()
                
                switch uistate.appIndex {
                    
                case .Find:
                    FindView()
                    
                case .Libray:
                    LibrayView()
                     
                    
                case .Search:
                    SearchView()
                    
                }
                
                Tabbar()
                
            }
            .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading) {
                            PF_AsyncImage(UIImage(named: "LiseamiAvatar"))
                                .scaledToFill()
                                .frame(width: 32, height: 32)
                        }
                    })
            
            .PF_FullScreen(isPresented: $uistate.showLaperView,
                           onDismiss: {},
                           content: {LaperView()}
            )
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(.accentColor)
        .preferredColorScheme(uistate.showLaperView ? .dark : .light)
   
      
    }
    
   

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
