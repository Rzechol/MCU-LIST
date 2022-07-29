//
//  MainView.swift
//  XDP
//
//  Created by Bartosz Rzechółka on 20/07/2022.
//

import SwiftUI

struct MainView: View {
    
    //MARK: - PROPERTIES
    
    var poster: [Poster] = posterData
    
    //MARK: - BODY
    
   @AppStorage("MainView") var isMainViewActive: Bool = true
    var body: some View {
        
        ZStack{
            
        TabView {
            ForEach(poster[0...23]){item in
                PosterCardView(poster: item)
            }
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
            
        
        
}
    }
//MARK: - PREVIEV
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(poster: posterData)
    }
}
}
