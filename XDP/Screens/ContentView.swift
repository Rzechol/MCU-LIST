//
//  ContentView.swift
//  XDP
//
//  Created by Bartosz Rzechółka on 25/07/2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    
    @State private var isShowingSettings: Bool = false
    
    var poster: [Poster] = posterData
    
    //MARK: - BODY
    
    var body: some View {
        NavigationView{
            List {
                ForEach(poster) { item in
                    NavigationLink(destination: PosterDetailView(poster: item)){
                    PosterRowView(poster: item)
                        .padding(.vertical, 4)
                }
            }
            }
            .navigationTitle("MCU FILMS")
            .navigationBarItems(
            trailing:
                Button(action: {
                    isShowingSettings = true
                }){
                    Image(systemName: "slider.horizontal.3")
                }
                .sheet(isPresented: $isShowingSettings) {
                    SettinsView()
                }
            )
            
        }
       
    }
    
}
//MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(poster: posterData)
    }
}
