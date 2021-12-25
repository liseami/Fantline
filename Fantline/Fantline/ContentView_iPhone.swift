//
//  ContentView.swift
//  Fantline
//
//  Created by Liseami on 2021/11/25.
//

import SwiftUI
import CoreData

struct ContentView_iPhone: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var uistate = UIState.shared
    
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
            .toolbar(content: {UserAvatar})

            .PF_FullScreen(isPresented: $uistate.showLaperView,
                           onDismiss: {},
                           content: {LaperView()}
            )
            .PF_FullScreen(isPresented: $uistate.showLoginView) {
            } content: {
                LoginView()
            }

            
        }
        .accentColor(.accentColor)
        .preferredColorScheme(uistate.showLaperView ? .dark : .light)
        .navigationViewStyle(.stack)
    
   
      
    }
    
    var UserAvatar :  some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                uistate.showLoginView.toggle()
            } label: {
                PF_AsyncImage(UIImage(named: "LiseamiAvatar"))
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
            }
        }
    }
    
   

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_iPhone().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
