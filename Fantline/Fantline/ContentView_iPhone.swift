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
            .toolbar(content: {MainToolBar})
            .PF_FullScreen(isPresented: $uistate.showLaperView,
                           onDismiss: {},
                           content: {LaperView()}
            )
            .PF_FullScreen(isPresented: $uistate.showLoginView) {
            } content: {
                LoginView()
            }
            .PF_FullScreen(isPresented: $uistate.showSettingView) {
            } content: {
                SettingView()
            }
            .PF_Navilink(isPresented: $uistate.showfilmDetailView) {
                FilmDetailView()
            }
            .PF_Sheet(isPresented: $uistate.showAddMenu, backColor: .clear) {
                addMenu
            }
            .PF_Navilink(isPresented: $uistate.showProfileView) {
                ProfileView()
            }

            
        }
        .accentColor(.accentColor)
        .navigationViewStyle(.stack)
    
   
      
    }
    
    var addMenu : some View {
        HStack{
            Spacer()
            VStack{
                ICON(name: "Edit",fcolor: .CashRed,size: 32)
                    .frame(width: GoldenH * 1.618, height: GoldenH)
                    .background(Color.Card)
                    .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                Text("灵感速记")
            }
            Spacer()
            VStack{
                ICON(name: "Clipboard-list",fcolor: .FilmYellow,size: 32)
                    .frame(width: GoldenH * 1.618, height: GoldenH)
                    .background(Color.Card)
                    .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                Text("拉片文档")
            }
            Spacer()
            VStack{
                ICON(name: "Menu",fcolor: .FilmBlue,size: 32)
                    .frame(width: GoldenH * 1.618, height: GoldenH)
                    .background(Color.Card)
                    .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                Text("电影评论")
            }
            Spacer()
        }
        .mFont(style: .Body_13_R,color: .fc2)
        .padding(.all,16)
        .background(BlurView())
        .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
        .padding(.all,20)
    }
    
    var MainToolBar :  some ToolbarContent {
        Group{
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    uistate.showSettingView.toggle()
                } label: {
                    ICON(sysname:"gearshape",fcolor: .fc1){
                        uistate.showSettingView.toggle()
                    }
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    uistate.showProfileView.toggle()
//                    uistate.showLoginView.toggle()
                } label: {
                    PF_AsyncImage(UIImage(named: "19"))
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                }
            }
        
        }
       
    }
    
   

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_iPhone()
            .preferredColorScheme(.dark)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
          
    }
}
