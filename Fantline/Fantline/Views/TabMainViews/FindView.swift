//
//  FindView.swift
//  Fantline
//
//  Created by Liseami on 2021/12/14.
//

import SwiftUI

struct FindView: View {
    var body: some View {
        
        
      List{
          ForEach(0..<12){index in
              Text("《" + randomString(Int.random(in: 2..<6)) + "》")
          }
      }
      .listStyle(.insetGrouped)
      .navigationBarTitleDisplayMode(.inline)
      .navigationTitle("发现")
      
           
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_iPhone(uistate: .init(.Find))
    }
}
